<?php
/**
 * OpenSSO integration library for PHP
 *
 * @license MIT
 * @author Jorge López Pérez <jorge@adobo.org>
 * @version 1.0.10
 * @package libopensso-php
 */

namespace US\OpenSSO;

/**
  * Helper class for OpenSSO integration
  * @package libopensso-php
  */
class InternalHandler {

    /**
     * Library version, used inside User-Agent
     */
    const VERSION = '1.0.10';

    /**
     * Default cookie name
     */
    const DEFAULT_COOKIENAME = 'iPlanetDirectoryPro';

    /**
     * Metadata path
     */
    protected $path;

    /**
     * Cached metadata
     */
    protected $metadata;

    /**
     * Chosen environment
     */
    protected $env;

    /**
     * Current cookie name
     */
    private $cookiename;

    /**
     * Current user SSO token
     */
    private $token;

    /**
     * Attributes for current user
     */
    private $attributes;

    /**
     * Context needed for stream functions
     */
    private $context;

    /**
     * Constructs a new OpenSSO client handler
     *
     * @param string $env Which environment from metadata should this helper use
     * @param boolean $fetch_cookie_name When true cookie name will be
     *        fetched from server using getCookieNameForToken
     * @param string $metadata_dir Directory to load metadata from
     * @throws \Exception On error
     */
    public function __construct($env = 'opensso-pre.us.es', $fetch_cookie_name = FALSE, $metadata_dir = '') {
        // Set current path
        $this->path = empty($metadata_dir) ?
            dirname(__FILE__) . '/../../../metadata/' :
            $metadata_dir;

        // Initialization
        $metadata = @parse_ini_file($this->path . '/metadata.ini',
                TRUE);

        if (!isset($metadata[$env])) {
            throw new \Exception('Metada for ' . $env . ' not found');
        } else {
            $this->env = $env;
            $this->metadata = $metadata[$env];
        }

        $this->createStream();
        $this->setCookieName($fetch_cookie_name);
        $this->readToken();
    }

    /**
     * Checks if current user has a valid SSO session
     *
     * @return boolean  User has a valid SSO session or not
     */

    public function validateToken() {
        if (empty($this->token)) {
            return FALSE;
        }

        // Check for valid session
        try {
            $res = $this->doRequest('isTokenValid', 'GET',
                    'tokenid=' . urlencode($this->token));
        } catch (\Exception $e) {
            $this->token = '';
            $code = $e->getCode();

            if ($code == 403) {
                throw new \Exception('Access forbidden to OpenSSO');
            } elseif ($code == 401) {
                return FALSE;
            } else {
                throw $e;
            }
        }

        if (preg_match('/true/', $res)) {
            // SSO token is valid
            $this->fetchAttributes();
            return TRUE;
        } else {
            $this->token = '';
            return FALSE;
        }
    }


    /**
     * Fetchs user attributes
     *
     * @internal
     * @return void
     */

    protected function fetchAttributes() {
        if (empty($this->token)) {
            throw new \Exception('Empty token');
        }

        $res = $this->doRequest('attributes', 'GET',
                'subjectid=' . urlencode($this->token));

        $attributes = array();

        $lines = preg_split("/\r\n|\n|\r/", $res);
        $atr = "";
        $values = array();
        foreach ($lines as $line) {
            $piece = preg_split("/=/", $line);
            if ($piece[0] == "userdetails.attribute.name") {
                // Store attribute
                if (!empty($atr)) {
                    $atr = strtolower($atr);
                    $this->attributes[$atr] = count($values) == 1 ?
                                $values[0] :
                                $values;
                    $values = array();
                }
                $atr = $piece[1];
            } else if ($piece[0] == "userdetails.attribute.value") {
                $values[] = $piece[1];
            }
        }

        // Last attribute
        if (!empty($atr)) {
            $this->attributes[$atr] = count($values) == 1 ?
                        $values[0] :
                        $values;
            $values = array();
        }
    }

    /**
     * Connects to an OpenSSO identity service and retrieves answer
     *
     * @internal
     * @param string $service Web service to be queried
     * @param string $method HTTP method to be used
     * @param string $query Query that have to be appended to the URL
     * @return string Answer from server
     * @throw \Exception Thrown on connection problems and when HTTP response code is not 200
     */

    protected function doRequest($service, $method = 'GET', $query = '') {
        $uri = parse_url($this->metadata['ws_base_url'] . $service);

        $socket_dest = $uri['scheme'] == 'http' ? 'tcp' : 'tls';
        $socket_dest .= '://';

        switch ($uri['scheme']) {
            case 'http':
                $port = isset($uri['port']) ? $uri['port'] : 80;
                $socket_dest .= $uri['host'] . ':' . $port . '/';
                $fp = @stream_socket_client($socket_dest, $errno, $errstr,
                        15, STREAM_CLIENT_CONNECT);
                break;
            case 'https':
                $port = isset($uri['port']) ? $uri['port'] : 443;
                $socket_dest .= $uri['host'] . ':' . $port . '/';
                $fp = @stream_socket_client($socket_dest, $errno, $errstr,
                        20, STREAM_CLIENT_CONNECT, $this->context);
                break;
            default:
                throw new \Exception('Invalid protocol: ' . $uri['scheme']);
        }

        if (!$fp) {
            if (FALSE === $fp && $errno == 0) {
                throw new \Exception('SSL verification failed or '
                        .'connection failed. ['.$errstr.']');
            } else {
                throw new \Exception('Connection failed. ['.$errno
                        . ', ' . $errstr.']');
            }
        }


        // Certificate validation
        $options = stream_context_get_options($this->context);
        $site_cert =
            openssl_x509_parse($options['ssl']['peer_certificate']);

        $path = isset($uri['path']) ? $uri['path'] : '/';
        if (!empty($query)) {
            $path .= '?' . $query;
        }

        // Create HTTP request.
        $defaults = array(
                'Host' => "Host: " . $uri['host'],
                'User-Agent' => 'User-Agent: libopensso-php '
                    . self::VERSION,
        );

        $request = $method .' '. $path ." HTTP/1.0\r\n";
        $request .= implode("\r\n", $defaults);
        $request .= "\r\n\r\n";

        fwrite($fp, $request);

        // Fetch response.
        $response = '';
        while (!feof($fp) && $chunk = fread($fp, 1024)) {
            $response .= $chunk;
        }
        fclose($fp);

        // Parse response.
        $tmpdata = '';
        list($split, $tmpdata) = explode("\r\n\r\n", $response, 2);
        $split = preg_split("/\r\n|\n|\r/", $split);

        list($protocol, $code, $text) = explode(' ', trim(array_shift($split)), 3);

        if ($code != '200') {
            throw new \Exception('HTTP response code ' . $code,
                    intval($code));
        }

        return trim($tmpdata);
    }


    /**
     * Returns an attribute value/values
     *
     * @param string $atr Attribute name
     * @param boolean $force_array Whether to cast to array even if attribute has a single value
     * @return mixed Array value(s) or false if attribute was not found
     */

    public function attribute($atr, $force_array = FALSE) {
        if (empty($atr)) {
            throw new \Exception('Empty attribute name');
        } else {
            $atr = strtolower($atr);
            if (isset($this->attributes[$atr])) {
                if ($force_array && !is_array($this->attributes[$atr])) {
                    return array($this->attributes[$atr]);
                } else {
                    return $this->attributes[$atr];
                }
            } else {
                return FALSE;
            }
        }
    }

    /**
     * Returns all attributes
     *
     * @param boolean $force_arrays Force use of arrays even on single valued attributes
     */
    public function allAttributes($force_arrays = FALSE) {
        $atr = array();
        if ($force_arrays === TRUE) {
            foreach ($this->attributes as $a => $v) {
                if (!is_array($v)) {
                    $v = array($v);
                }

                $atr[$a] = $v;
            }
        } else {
            $atr = $this->attributes;
        }
        return $atr;
    }

    /**
     * Returns login URL for current environment
     *
     * @return string OpenSSO login URL
     */
    public function getLoginUrl() {
        return $this->metadata['login_url'];
    }

    /**
     * Returns logout URL for current environment
     *
     * @return string OpenSSO logout URL
     */
    public function getLogoutUrl() {
        return $this->metadata['logout_url'];
    }

    /**
     * Creates data stream to server with SSL options
     *
     * @internal
     * @throws \Exception On error
     */

    private function createStream() {
        $this->context = stream_context_create();
        $options = array('ssl' =>
                array(
                    'verify_peer' => TRUE,
                    'cafile' => $this->path . '/crt/' . $this->env . '/ca.crt',
                    'capture_peer_cert' => TRUE,
                    ));

        if (isset($this->metadata['self_signed']) &&
                $this->metadata['self_signed'] == '1') {
            unset($options['ssl']['cafile']);
            $options['ssl']['allow_self_signed'] = TRUE;
        } else {
            if (!file_exists($options['ssl']['cafile'])) {
                throw new \Exception('CA certificate file not found on '
                        . $options['ssl']['cafile']);
            }
        }

        $result = stream_context_set_option($this->context, $options);

        if (FALSE === $result) {
            throw new \Exception('Error setting options for ssl context');
        }
    }

    /**
     * Prepares cookie name, using the default one or asking the server for
     *
     * @internal
     * @param boolean $ask_server Ask server for cookie name if TRUE
     */

    private function setCookieName($ask_server = FALSE) {
        if (TRUE === $ask_server) {
            $res = $this->doRequest('getCookieNameForToken', 'POST');
            $this->cookiename = preg_replace('/^string=/', '', $res);
        } else {
            $this->cookiename = self::DEFAULT_COOKIENAME;
        }
    }


    /**
     * Reads SSO token from either cookie or GET parameter (solves IE issues
     * with two letter domains)
     *
     * @internal
     */
    private function readToken() {
        // Retrieve token from GET or cookie (IE bug)
        if (isset($_GET[$this->cookiename]) &&
                (!isset($_COOKIE[$this->cookiename]) ||
                 $_COOKIE[$this->cookiename] != $_GET[$this->cookiename])) {

            // Internet Explorer workaround
            if (isset($_SERVER['HTTPS'])) {
                $this->token = $_GET[$this->cookiename];
            }

            setcookie($this->cookiename, $this->token, 0, '/',
                    $_SERVER['HTTP_HOST'], TRUE);
        } elseif (isset($_COOKIE[$this->cookiename])) {
            // Incorrect encoding of + to " "
            $this->token = preg_replace('/ /', '+',
                    $_COOKIE[$this->cookiename]);
        }
    }

}
