<?php
	session_start();
	if($_SESSION["accountId"] === null) {
		header('location: login.php');
	}
?>
<!DOCTYPE html>
<html>

<head>	
	<?php $accountId = $_SESSION["accountId"];?>
	<?php require('includes/header.htm');?>
	<?php require('includes/db.php');?>
</head>

<body>
	<?php include ('includes/nav.htm');?>
    
    <div class="container">
        <table id="mainTable" class="table table-condensed" cellspacing="0" width="100%">
			<caption><b>Schedule Items</b><button type="submit" class="btn btn-success btn-sm addScheduleButton pull-right">Add Item</button></caption>
			<thead>
                <th>Date</th>
                <th>Customer</th>
                <th>Consultant</th>
                <th>Activity</th>
                <th>Role</th>
                <th></th>
			</thead>
			<tbody>
                <?php include('scripts/displaySchedules.php')?>
			</tbody>
		</table>
	</div>

    <footer>
		<?php include ('includes/footer.htm');?>
    </footer>

</body>

</html>
