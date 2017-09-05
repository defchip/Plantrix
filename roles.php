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
	<?php include 'includes/header.htm';?>
	<?php require 'includes/db.php';?>
<!--	<script src="scripts/activities.js"></script>-->
</head>

<body>
	<?php include ('includes/nav-tables.htm');?>  
    
    <div class="container">
        <table id="mainTable" class="table table-condensed" cellspacing="0" width="100%">
			<caption class="text-center"><b>Roles</b><button class="btn btn-success addButton btn-sm pull-right">Add Roles</button></caption>
			<thead>
                <th>Roles</th>
                <th></th>
			</thead>
			<tbody>
			<?php include('scripts/displayRoles.php')?>
			</tbody>
		</table>
	</div>

<footer>
	<?php include ('includes/footer.htm');?>
</footer>

</body>

</html>