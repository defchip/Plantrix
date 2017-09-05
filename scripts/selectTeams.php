<?php
	try {
		$accountId = $_SESSION["accountId"];
		$cmd = $conn->prepare("SELECT TEAM_ID, TEAM FROM TEAMS WHERE ACCOUNT_ID = :accountId AND IS_DELETED = 0 ORDER BY ITEM_ORDER");
		$cmd->execute(array(':accountId' => $accountId));
	} catch(PDOException $ex) {
		echo $ex->getMessage();
	}
	if ($cmd->rowCount() > 0) {
		while ($row = $cmd->fetch()) {
			echo "<option value='".$row["TEAM_ID"]."'>".$row["TEAM"]."</option>";
		}
	} else {
		echo "<option>n/a</option>";
	}
?>