<?php
	session_start();
?>
<!DOCTYPE html>
<html>

<head>
    <title>Logout</title>
    <?php
		session_unset();
        session_destroy();
		$conn = null;
		require 'includes/header.htm';
	?>
    <script src="scripts/logout.js"></script>
</head>

<body>
    <div id="logoutDialog" title="Logout">
        <p>You have successfully logged out.</p>
    </div>
</body>

</html>

<script>
    $(window).bind("pageshow", function(event) {
    if (event.originalEvent.persisted) {
        window.location.reload() 
    }
});
</script>