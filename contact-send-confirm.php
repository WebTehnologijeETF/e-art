<!doctype html>
<html>

<head>
	<link rel="stylesheet" href="styles/common.css" />
	<link rel="stylesheet" href="styles/rows.css" />
	<link rel="stylesheet" href="styles/cols.css" />
	<link rel="stylesheet" href="styles/index.css" />
	<link rel="stylesheet" href="styles/tables.css" />
	<link rel="stylesheet" href="styles/links.css" />
	<link rel="stylesheet" href="styles/contact.css" />
</head>

<body>

	<?php
		if(
			!isset($_GET['email']) || !isset($_GET['email-repeat']) || !isset($_GET['phone']) ||
			!isset($_GET['message-title']) || !isset($_GET['message']) || !isset($_GET['mjesto']) ||
			!isset($_GET['postanski-broj'])
		) {
			die('Insufficient data');
		}
		
		function echo_input($field_name, $value_field, $condition, $show_error_and_valid) {
			echo 
'                               <div id="el-35" class="row row-6 text-stroke form-item-title">' . "\n" .
								$field_name . '&nbsp;' . "\n";
			if($show_error_and_valid) {
				echo (!$condition ?
	('                                       <span id="email-error-provider" class="error-message visible">' . "\n" .
	'                                               <img class="icon-image" src="images/contact/x.png">' . "\n" .
	'                                               Not ok.' . "\n" .
	'                                       </span>' . "\n") :
	('                                       <span id="email-valid-provider" class="valid-message visible">' . "\n" .
	'                                               <img class="icon-image" src="images/contact/tick-mark.jpg">' . "\n" .
	'                                               Its ok its ok.' . "\n" .
	'                                       </span>' . "\n") );
				}
                               echo 
'								</div>' . "\n" .
'                               <div id="el-36" class="row row-5 el-36">' . "\n" .
'                                       <input name="email" id="email-input" type="mail" class="contact-input" value="' . $value_field . '"></input>' . "\n" .
'                               </div>' . "\n";
		}
		
		$email = htmlspecialchars($_GET['email'], ENT_QUOTES, 'UTF-8');
		$email_repeat = htmlspecialchars($_GET['email-repeat'], ENT_QUOTES, 'UTF-8');
		$phone = htmlspecialchars($_GET['phone'], ENT_QUOTES, 'UTF-8');
		$message_title = htmlspecialchars($_GET['message-title'], ENT_QUOTES, 'UTF-8');
		$message = htmlspecialchars($_GET['message'], ENT_QUOTES, 'UTF-8');
		$mjesto = htmlspecialchars($_GET['mjesto'], ENT_QUOTES, 'UTF-8');
		$postanski_broj = htmlspecialchars($_GET['postanski-broj'], ENT_QUOTES, 'UTF-8');
		
		$phone_regex = "/^(\d[\s-]?)?[\(\[\s-]{0,2}?\d{3}[\)\]\s-]{0,2}?\d{3}[\s-]?\d{4}$/i";
		
		$is_email_valid = filter_var($email, FILTER_VALIDATE_EMAIL);
		$is_email_repeat_valid = $is_email_valid && ($email === $email_repeat);
		$is_phone_valid = (preg_match($phone_regex, $phone) != 0);
		$is_message_title_valid = (strlen($message_title) > 0);
		$is_message_valid = (strlen($message) > 0);
		
		var_dump($is_email_valid);
		var_dump($is_email_repeat_valid);
		var_dump($is_phone_valid);
		var_dump($is_message_title_valid);
		var_dump($is_message_valid);
		
		$is_form_data_valid = 
			$is_email_valid && $is_email_repeat_valid && $is_phone_valid && 
			$is_message_title_valid && $is_message_valid;
		
		echo 'entire form: ';
		var_dump($is_form_data_valid);
		
		echo
			'<div id="el-31" class="row row-80 el-31">' . "\n" .
			'<div id="el-32" class="col col-25 el-32">' . "\n" .
			'</div>' . "\n" .
			'<div id="el-33" class="col col-50 el-33">' . "\n";
		
		if($is_form_data_valid) {
			echo '<h1 class="error-message">Provjerite da li ste tacno popunili formu</h1>';
		}
		
		echo 
			'<form>';
			
		echo_input('Your email: ', $email, $is_email_valid, !$is_form_data_valid);
		echo_input('Repeat your email: ', $email_repeat, $is_email_repeat_valid, !$is_form_data_valid);
		echo_input('Your phone: ' , $phone, $is_phone_valid, !$is_form_data_valid);
		echo_input('Message title: ', $message_title, $is_message_title_valid, !$is_form_data_valid);
		echo_input('Message: ', $message, $is_message_valid, !$is_form_data_valid);
		echo_input('Mjesto: ', $mjesto, FALSE, FALSE);
		echo_input('Postanski broj: ' , $postanski_broj, FALSE, FALSE);
		
		
		echo 
			'</form>';
		
		echo '</div>';
		
	?>

</body>

</html>