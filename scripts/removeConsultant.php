<?php
	$path = $_SERVER['DOCUMENT_ROOT'];
	$path .="/includes/db.php";
	require($path);

	if ($_SERVER["REQUEST_METHOD"] == "GET") {
		$consultantId = $_GET["data"];
		
		print_r($consultantId);
		
		try {
			$cmd = $conn->prepare("UPDATE CONSULTANTS SET IS_DELETED = -1 WHERE CONSULTANT_ID = :consultantId");
			$cmd->execute(array(
				':consultantId' => $consultantId
			));
		} catch(PDOException $ex) {
			echo "<p>".$ex->getMessage()."</p>";
		}
	}
?>