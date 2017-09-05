<?php
	session_start();
	if($_SESSION["accountId"] === null) {
        header('location: login.php');
	}
?>
<!DOCTYPE html>
<html>

<head>
    <?php echo "<title>".$_SESSION[ "accountName"]."</title>";?>
    <?php include 'includes/header.htm';?>
    <style>
        body {
            background: url(images/100_0029.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
</head>

<body>
    <?php include ('includes/nav.htm');?>
    
<!--    <div class="container">
    	<div class="jumbotron" style="color: white">
    	<?php echo "<p style='color: white'>".$_SESSION[ "accountName"]."</p>";?>
		</div>
    </div>-->
    
	<div class="container">
		<div class="jumbotron" style="color: white">
			<p>Utilisation <span class="glyphicon glyphicon-info-sign"></span>
			</p>
			<div class="progress">
				<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"></div>
			</div>
			<p>Deployment <span class="glyphicon glyphicon-info-sign"></span>
			</p>
			<div class="progress">
				<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"></div>
			</div>
			<p>Skill Match <span class="glyphicon glyphicon-info-sign"></span>
			</p>
			<div class="progress">
				<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"></div>
			</div>
			<p>Unpaid Absence <span class="glyphicon glyphicon-info-sign"></span>
			</p>
			<div class="progress">
				<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"></div>
			</div>
			<p>Proximity Target <span class="glyphicon glyphicon-info-sign"></span>
			</p>
			<div class="progress">
				<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"></div>
			</div>
		</div>
	</div>

    <script> //sample utilisation display values
        var bars = document.getElementsByClassName("progress-bar");

        for (bar in bars) {
            var x = Math.floor((Math.random() * 100) + 1);
            bars[bar].style.width = x + "%";
            bars[bar].innerHTML = x + "%";
            if (x <= 33) {
                bars[bar].className = "progress-bar progress-bar-danger progress-bar-striped active";
            }
            if (x > 33 & x <= 66) {
                bars[bar].className = "progress-bar progress-bar-warning progress-bar-striped active";
            }
            if (x > 66) {
                bars[bar].className = "progress-bar progress-bar-success progress-bar-striped active";
            }
        }
    </script>
    <br>
</body>

</html>
