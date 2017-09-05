<?php
	try {
		$accountId = $_SESSION["accountId"];
		$cmd = $conn->prepare("SELECT CONSULTANT_ID, CONCAT(FORENAMES,' ',SURNAME) AS 'CONSULTANT' FROM CONSULTANTS WHERE ACCOUNT_ID = :accountId AND IS_DELETED = 0");
		$cmd->execute(array(':accountId' => $accountId));
	} catch(PDOException $ex) {
		echo $ex->getMessage();
	}
	
	if ($cmd->rowCount() > 0) {
		while ($row = $cmd->fetch()) {
			echo "<option value='".$row["CONSULTANT_ID"]."'>".$row["CONSULTANT"]."</option>";
		}
	} else {
		echo "<option>n/a</option>";
	}
?>