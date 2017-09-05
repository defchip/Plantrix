<?php session_start(); ?>
<!DOCTYPE html>
<html>

<head>
    <title>Login</title>
    <?php include ('includes/header.htm');?>
    <?php $conn=null;?>
    <style>
        body {
            background: url(images/100_0029.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand logoFont" href="index.php"><b>planTrix</b></a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.php"><span class="glyphicon glyphicon-link"></span> Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="jumbotron">
            <form role="form" action="login.php" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" name="username" required>
                </div>
                <div class="form-group ">
                    <label for="password">Password</label>
                    <input type="password" class="form-control " name="password" required>
                </div>
                <button type="submit " class="btn btn-default ">Login</button>
            </form>
        </div>
    </div>

	<?php
		if(isset($_SESSION['ERRMSG_ARR']) && is_array($_SESSION[ 'ERRMSG_ARR']) && count($_SESSION[ 'ERRMSG_ARR'])>0) { 				echo '<div class="container alert alert-danger" role="alert">';
			echo '<ul>';																												foreach($_SESSION['ERRMSG_ARR'] as $msg) {
				echo '<li>'.$msg.'</li>';
				}
			echo '</ul>';
			echo '</div>';
			unset($_SESSION['ERRMSG_ARR']); }
	?>
</body>

</html>
