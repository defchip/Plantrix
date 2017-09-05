<?php
session_start();
$errmsg_arr = array();
$errflag = false;

$dbhost 	= "10.169.0.57";
$dbname		= "plantrix_dev_01";
$dbuser		= "plantrix_user";
$dbpass		= "w377P83*UJ43nz04fmnz";
 
try {
	$conn = new PDO("mysql:host=$dbhost;dbname=$dbname",$dbuser,$dbpass);
	
	if(empty($_POST['username'])){
		$errmsg_arr[] = "Please enter your username";
		$errflag = true;
	}else{
		$username = trim($_POST['username']);
	}
	
	if(empty($_POST['password'])){
		$errmsg_arr[] = "Please enter your password";
		$errflag = true;
	}else{
		$password = trim($_POST['password']);
	}
 
	$cmd = $conn->prepare("SELECT * FROM V_USER_ACCOUNTS WHERE USERNAME = :username");
	$cmd->bindParam(':username', $username);
	
	$cmd->execute();
	$rows = $cmd->fetch();
} catch(PDOException $ex) {
    echo "catch!";
}

if($rows > 0) {
	if(password_verify($password, $rows["PWORD"])) {
		header("location: home.php");
		$_SESSION["accountId"] = $rows["ACCOUNT_ID"];
		$_SESSION["accountName"] = $rows["ACCOUNT_NAME"];
		exit();
	} else {
		$errmsg_arr[] = 'Username or Password not found';
		$errflag = true;
	}
} else {
	$errmsg_arr[] = 'Username or Password not found';
	$errflag = true;
}

if($errflag) {
	$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
	session_write_close();
	header("location: index.php");
	exit();
}