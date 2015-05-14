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
	
	$email = htmlspecialchars($_GET['email'], ENT_QUOTES, 'UTF-8');
	$email_repeat = htmlspecialchars($_GET['email-repeat'], ENT_QUOTES, 'UTF-8');
	$phone = htmlspecialchars($_GET['phone'], ENT_QUOTES, 'UTF-8');
	$message_title = htmlspecialchars($_GET['message-title'], ENT_QUOTES, 'UTF-8');
	$message = htmlspecialchars($_GET['message'], ENT_QUOTES, 'UTF-8');
	$mjesto = htmlspecialchars($_GET['mjesto'], ENT_QUOTES, 'UTF-8');
	$postanski_broj = htmlspecialchars($_GET['postanski-broj'], ENT_QUOTES, 'UTF-8');

	$url = 'https://api.sendgrid.com/';
	$user = 'sr0GE7Cj0Z';
	$pass = 'fdHrku7mZJ';

	$params = array(
		'api_user'  => $user,
		'api_key'   => $pass,
		'to'        => 'fmustafic1@etf.unsa.ba',
		'subject'   => 'testing from curl',
		'html'      => $message . ' phone: ' . $phone,
		'text'      => $message . ' phone: ' . $phone,
		'from'      => $email,
		'cc'		=> 'vljubovic1@etf.unsa.ba',
	  );

	$request =  $url . 'api/mail.send.json';

	// Generate curl request
	$session = curl_init($request);
	// Tell curl to use HTTP POST
	curl_setopt ($session, CURLOPT_POST, true);
	// Tell curl that this is the body of the POST
	curl_setopt ($session, CURLOPT_POSTFIELDS, $params);
	// Tell curl not to return headers, but do return the response
	curl_setopt($session, CURLOPT_HEADER, false);
	// Tell PHP not to use SSLv3 (instead opting for TLS)
	curl_setopt($session, CURLOPT_SSLVERSION, CURL_SSLVERSION_TLSv1_2);
	curl_setopt($session, CURLOPT_RETURNTRANSFER, true);

	// obtain response
	$response = curl_exec($session);
	curl_close($session);

	// print everything out
	print_r($response);
	
	echo 
		'<h3>' . 'Mail poslan' . '</h1>';
		
	echo
		'<form action="index.php">' .
			'<button type="submit">Home1</button>' .
		'</form>';

?>

<?php
	include 'templates/footer.php';
?>