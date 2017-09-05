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
	<script src="scripts/consultants.js"></script>
	
	<?php 
	if (!empty($_POST['_add'])) {
		if ($_SERVER["REQUEST_METHOD"] == "POST") {
			$teamId = $_POST["teamId"];			
			$forenames = $_POST["forenames"];
			$surname = $_POST["surname"];
			$salary = $_POST["salary"];
			$postcode = $_POST["postcode"];

			try {
				$cmd = $conn->prepare("INSERT INTO CONSULTANTS (FORENAMES, SURNAME, SALARY, TEAM_ID, POSTCODE, ACCOUNT_ID) VALUES (:forenames,:surname,:salary,:teamId,:postcode,:accountId)");
				$cmd->execute(array(
					':forenames' => $forenames,
					':surname' => $surname,
					':salary' => $salary,
					':teamId' => $teamId,
					':postcode' => $postcode,
					':accountId' => $_SESSION["accountId"]
				));
			} catch(PDOException $ex) {
				echo "<p>".$ex->getMessage()."</p>";
			}
		}
	}
	if (!empty($_POST['_edit'])) {
		if ($_SERVER["REQUEST_METHOD"] == "POST") {
			$teamId = $_POST["teamId"];			
			$forenames = $_POST["forenames"];
			$surname = $_POST["surname"];
			$salary = $_POST["salary"];
			$postcode = $_POST["postcode"];
			$consultantId = $_POST["consultantId"];

			try {
				$cmd = $conn->prepare("UPDATE CONSULTANTS SET FORENAMES = :forenames, SURNAME = :surname, SALARY = :salary, TEAM_ID = :teamId, POSTCODE = :postcode WHERE CONSULTANT_ID = :consultantId");
				$cmd->execute(array(
					':forenames' => $forenames,
					':surname' => $surname,
					':salary' => $salary,
					':teamId' => $teamId,
					':postcode' => $postcode,
					':consultantId' => $consultantId
				));
			} catch(PDOException $ex) {
				echo "<p>".$ex->getMessage()."</p>";
			}
		}
	}
	?>
</head>

<body>
	<?php include ('includes/nav-tables.htm');?>
  
  	<div id="removeDialog" title="Remove Consultant">
  		<p>Are you sure you want to remove this consultant?</p>
  	</div>
  	
	<div id="removeSuccessDialog" title="Remove Consultant">
  		<p>Consultant removed.<p>
  	</div>
  	
	<div id="removeErrorDialog" title="Remove Consultant">
  		<p>Could not remove Consultant.</p>
  	</div>
  
 	<div id="addDialog" title="Add Consultant">
	  	<form role="form" method="POST" action="<?php //echo htmlspecialchars($_SERVER:["PHP-SELF"]);?>">
		<div class="form-group">
				<label for="forename">Forename</label>
				<input type="text" name="forenames" required class="form-control">
				<input type="hidden" name="consultantId">
		</div>
		<div class="form-group">
				<label for="surname">Surname</label>
				<input type="text" name="surname" required class="form-control">
		</div>
		<div class="form-group">
				<label for="salary">Salary</label>
				<input type="text" name="salary" required class="form-control">
		</div>
		<div class="form-group">
				<label for="postcode">Postcode</label>
				<input type="text" name="postcode" required class="form-control">
		</div>
	   	<div class="form-group">
		   <label for="Team">Team</label>
		   <select class="form-control" name="teamId" required>
		   	<option value=''></option>
			<?php include 'scripts/selectTeams.php';?>
		   </select>
		</div>
		<div class="form-group">
	  		<input type="submit" name="_add" class="btn btn-success pull-right">
		</div>
		</form>
	</div>

  	<div id="editDialog" title="Edit Consultant">
	  	<form role="form" method="POST" action="<?php //echo htmlspecialchars($_SERVER["PHP-SELF"]);?>">
		<div class="form-group">
				<label for="forename">Forename</label>
				<input type="text" name="forenames" id="fn" required class="form-control">
				<input type="hidden" name="consultantId" id="cId">
		</div>
		<div class="form-group">
				<label for="surname">Surname</label>
				<input type="text" name="surname" id="sn" required class="form-control">
		</div>
		<div class="form-group">
				<label for="salary">Salary</label>
				<input type="text" name="salary" id="ct" required class="form-control">
		</div>
   		<div class="form-group">
				<label for="postcode">Postcode</label>
				<input type="text" name="postcode" id="pc" required class="form-control">
		</div>
	   	<div class="form-group">
		   <label for="Team">Team</label>
		   <select class="form-control" name="teamId" id="tm" required>
			<?php include 'scripts/selectTeams.php';?>
		   </select>
		</div>
		<div class="form-group">
		  <input type="submit" name="_edit" class="btn btn-success pull-right">
		</div>
	  </form>
	</div>
    
    <div class="container">
        <table id="mainTable" class="table table-condensed" cellspacing="0" width="100%">
			<caption class="text-center"><b>Consultants</b><button class="btn btn-success addButton btn-sm pull-right">Add Consultant</button></caption>
			<thead>
                <th>Surname</th>
                <th>Forenames</th>
                <th style="display:none"></th>
                <th>Team</th>
                <th>Salary</th>
                <th>Postcode</th>
                <th></th>
			</thead>
			<tbody>
			<?php include('scripts/displayConsultants.php')?>
			</tbody>
		</table>
	</div>

<footer>
	<?php include ('includes/footer.htm');?>
</footer>

</body>

</html>