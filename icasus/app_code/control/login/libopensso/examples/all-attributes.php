<?php

require_once('../vendor/autoload.php');

$u = new \US\OpenSSO\User();

if ($u->enforceAuthentication()) {
	echo '<h1>Your attributes:</h1>';
	$attr = $u->allAttributes(TRUE);
	foreach ($attr as $name => $values) {
		echo '<h2>' . $name . '</h2>';
		echo '<ul>';
		foreach ($values as $v) {
			echo '<li>' . $v . '</li>';
		}
		echo '</ul>';
	}
}

