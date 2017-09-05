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
<!--	<script src="scripts/customers.js"></script>-->
</head>

<body>
	<?php include ('includes/nav-tables.htm');?>  
    
    <div class="container">
        <table id="mainTable" class="table table-condensed" cellspacing="0" width="100%">
			<caption class="text-center"><b>Customers</b><button class="btn btn-success addButton btn-sm pull-right">Add Customer</button></caption>
			<thead>
                <th>Customer</th>
                <th></th>
			</thead>
			<tbody>
			<?php include('scripts/displayCustomers.php')?>
			</tbody>
		</table>
	</div>

<footer>
	<?php include ('includes/footer.htm');?>
</footer>

</body>

</html>