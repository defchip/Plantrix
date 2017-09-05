<?php
	session_start();
	$path = $_SERVER['DOCUMENT_ROOT'];
	$path .="/includes/db.php";
	require($path);

	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		$teamId = $_POST["teamId"];			
		$forenames = $_POST["forenames"];
		$surname = $_POST["surname"];
		$cost = $_POST["cost"];
		
		try {
			$cmd = $conn->prepare("INSERT INTO CONSULTANTS (FORENAMES, SURNAME, SALARY, TEAM_ID, ACCOUNT_ID) VALUES (:forenames,:surname,:cost,:teamId,:accountId)");
			$cmd->execute(array(
				':forenames' => $forenames,
				':surname' => $surname,
				':salary' => $salary,
				':teamId' => $teamId,
				':accountId' => $_SESSION["accountId"]
			));
		} catch(PDOException $ex) {
			echo "<p>".$ex->getMessage()."</p>";
		}
	}
//	$path = $_SERVER['DOCUMENT_ROOT'];
	$path = $_SERVER['HTTP_HOST'];
	$path .="/scripts/consultants.php";
	echo $path;
	header("Location: $path"); 
?>