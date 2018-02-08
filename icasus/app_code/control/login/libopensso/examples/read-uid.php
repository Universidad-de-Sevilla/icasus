<?php

require_once('../vendor/autoload.php');

$u = new \US\OpenSSO\User();

if ($u->isAuthenticated()) {
    echo "Hi, " . $u->uid;
} else {
	echo "You're not logged in";
}
