<?php
    $cmd = $conn->prepare("SELECT * FROM V_SCHEDULES WHERE ACCOUNT_ID = :accountId");
   $cmd->execute(array(':accountId' => $accountId));

    if ($cmd->rowCount() > 0) {
        while ($row = $cmd->fetch()) {
            echo "<tr id='".$row["SCHEDULE_ITEM_ID"]."'>";
            echo "<td>".$row["SCHEDULE_DATE"]."</td><td>".$row["CUSTOMER"]."</td><td>".$row["CONSULTANT"]."</td><td>".$row["ACTIVITY"]."</td><td>".$row["ROLE"]."</td>";
            echo "<td style='text-align: right'>";
            echo "<button type='submit' class='btn btn-warning btn-xs editSchedButton'>Edit</button>&nbsp;";
            echo "<button type='submit' class='btn btn-danger btn-xs removeSchedButton'>Remove</button></td></tr>";
        }
    } else {
        echo "0 results";
    }
    $conn = null;
?>

