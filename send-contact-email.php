<?php
	include 'templates/header.php';
?>

<?php
	if(
		!isset($_GET['email']) || !isset($_GET['email-repeat']) || !isset($_GET['phone']) ||
		!isset($_GET['message-title']) || !isset($_GET['message']) || !isset($_GET['mjesto']) ||
		!isset($_GET['postanski-broj'])
	) {
		die('Insufficient data');
	}

	$to      = 'fmustafic1@etf.unsa.ba';
	$subject = 'the subject';
	$message = 'hello';
	$headers = 'From: webmaster@example.com' . "\r\n" .
		'Reply-To: webmaster@example.com' . "\r\n" .
		'X-Mailer: PHP/' . phpversion();

	mail($to, $subject, $message, $headers);
?>

<?php
	include 'templates/footer.php';
?>