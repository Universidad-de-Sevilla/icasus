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
  * Implements methods to manage OpenSSO interactions
  * @package libopensso-php
  */

class User {

    /**
     * OpenSSO internal handler
     */
    private $handler;

    /**
     * Creates a new OpenSSO user manager
     *
     * @param string $env Which environment from metadata should this helper use
     * @param boolean $ask_server When true cookie name will be
     *        fetched from server using getCookieNameForToken
     * @param string $metadata_dir Directory to load metadata from
     */

    public function __construct($env = 'ssopre.us.es_003',
            $ask_server = FALSE,
            $metadata_dir = '') {

        $this->handler = new InternalHandler($env, $ask_server,
                $metadata_dir);
    }

    /**
     * Enforces OpenSSO authentication by redirecting user to
     * OpenSSO login page if not currently logged in
     *
     * @param string $url optional URL to return after authentication
     * @return boolean determines if user was authenticated or not
     */

    public function enforceAuthentication($url = '') {
        $auth = $this->handler->validateToken();

        if (FALSE === $auth) {
            $url = (!empty($url) ? $url : $this->currentUrl());
            $login_url = $this->handler->getLoginUrl();
            header('Location: ' . $login_url . '?goto='
                    . urlencode($url));
        }

        return $auth;
    }

    /**
     * Checks current user authentication state
     *
     * @return boolean user has a valid session
     */
    public function isAuthenticated() {
        return $this->handler->validateToken();
    }

    /**
     * Logs out current user
     *
     * @param string $url optional URL to return after authentication
     * @return boolean determines if user was authenticated or not
     */

    public function logout($url = '') {
        // Remove IE cookie
        setcookie($this->cookiename, '', time() - 3600, '/');

        $url = (!empty($url) ? $url : $this->currentUrl());
        $logout_url = $this->handler->getLogoutUrl();
        header('Location: ' . $logout_url . '?goto='
                . urlencode($url));
    }

    /**
     * Magic __get method
     * @param string $name Attribute name
     * @return mixed Attribute value
     */
    public function __get($name) {
        return $this->handler->attribute($name);
    }

    /**
     * Reads attribute value and returns it as an array
     *
     * @param string $name Attribute name
     * @return Array Values for attribute
     */
    public function attributeAsArray($name) {
        return $this->handler->attribute($name, TRUE);
    }

    /**
     * Returns all attributes for current user
     *
     * @param boolean $use_arrays Whether to return values as arrays
     * @return Array Associative array of attribute => value
     */
    public function allAttributes($use_arrays = FALSE) {
        return $this->handler->allAttributes($use_arrays);
    }

    /**
     * Returns current URL
     *
     * @internal
     * @return string Current URL
     */

    private function currentUrl() {
        return (isset($_SERVER['HTTPS']) ? 'https' : 'http')
            . '://' . $_SERVER['SERVER_NAME']  . ':'
            . $_SERVER['SERVER_PORT']
            . $_SERVER['REQUEST_URI'];
    }
}
