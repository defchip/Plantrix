<?php
	$cmd = $conn->prepare("SELECT * FROM V_CONSULTANTS WHERE ACCOUNT_ID = :accountId AND IS_DELETED = 0 ORDER BY SURNAME");
	$cmd->execute(array(':accountId' => $accountId));

	if ($cmd->rowCount() > 0) {
		while ($row = $cmd->fetch()) {
			echo "<tr id='".$row["CONSULTANT_ID"]."'>";
			echo "<td>".$row["SURNAME"]."</td><td>".$row["FORENAMES"]."</td><td style='display:none' class='teamId'>".$row["TEAM_ID"]."</td><td>".$row["TEAM"]."</td><td>".$row["SALARY"]."</td><td>".$row["POSTCODE"]."</td>";
			echo "<td style='text-align: right'>";
			echo "<button type='submit' class='btn btn-warning btn-xs editButton' action='POST'>edit</button>&nbsp;";
			echo "<button type='submit' class='btn btn-danger btn-xs removeButton'>remove</button></td></tr>";
		}
	} else {
		echo "0 results";
	}
	$conn = null;
?>