<?php
define('CAS_SERVER_CA_CERT_PATH', '/var/www/icasus3/complete_chain_us_es.pem');
define('CC_SSO_CAS_URL', 'sso.us.es');
define('CC_SSO_CAS_PATH', '/CAS/index.php');
define('CC_SSO_CAS_PORT', 443);
require_once __DIR__ . '/../../cascara_core/phpCAS-1.3.8/CAS.php';
// Instancia el cliente
$host_sso = CC_SSO_CAS_URL;
$port_sso = CC_SSO_CAS_PORT;
$path_sso = CC_SSO_CAS_PATH;
phpCAS::client(CAS_VERSION_2_0, $host_sso, $port_sso, $path_sso);
// Habilita la validación del certificado y de su CN
phpCAS::setCasServerCACert(CAS_SERVER_CA_CERT_PATH, true);
phpCAS::forceAuthentication();
$datos['nombre'] = phpCAS::getAttribute('givenname');
$datos['apellidos'] = phpCAS::getAttribute('sn');
$datos['dni'] = phpCAS::getAttribute('irispersonaluniqueid');
$datos['mail'] = phpCAS::getAttribute('mail');
$datos['vinculo'] = phpCAS::getAttribute('usesrelacion');
print_r($datos);
exit();
