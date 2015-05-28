<?php
	session_start();

	if(isset($_SESSION['username'])) {
		echo 'Logging out.';
		unset($_SESSION);
		session_destroy();
		session_unset();
	}
	
	header('Location: index.php');
?>