<?php
	$dbhost 	= "10.169.0.57";
	$dbname		= "plantrix_dev_01";
	$dbuser		= "plantrix_user";
	$dbpass		= "w377P83*UJ43nz04fmnz";


	try {
		$conn = new PDO("mysql:host=$dbhost;dbname=$dbname",$dbuser,$dbpass);
		$conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	} catch(PDOException $ex) {
		echo "<p>".$ex->getMessage()."</p>";
	}