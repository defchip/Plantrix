<?php
	$cmd = $conn->prepare("SELECT *, CASE IS_CHARGEABLE WHEN -1 THEN 'Yes' ELSE 'No' END AS CHARGEABLE FROM ACTIVITIES WHERE ACCOUNT_ID = :accountId AND IS_DELETED = 0");
	$cmd->execute(array(':accountId' => $accountId));

	if ($cmd->rowCount() > 0) {
		while ($row = $cmd->fetch()) {
			echo "<tr id='".$row["ACTIVITY_ID"]."'>";
			echo "<td>".$row["ACTIVITY"]."</td><td>".$row["CHARGEABLE"]."</td>";
			echo "<td style='text-align: right'>";
			echo "<button type='submit' class='btn btn-warning btn-xs editButton' action='POST'>edit</button>&nbsp;";
			echo "<button type='submit' class='btn btn-danger btn-xs removeButton'>remove</button></td></tr>";
		}
	} else {
		echo "0 results";
	}
	$conn = null;
?>