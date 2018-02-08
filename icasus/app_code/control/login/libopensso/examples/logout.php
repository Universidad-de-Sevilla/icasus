<?php

require_once('../vendor/autoload.php');

$u = new \US\OpenSSO\User();

if ($u->isAuthenticated()) {
	$u->logout();
} else {
	echo 'You are not logged in';
}
