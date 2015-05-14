	<?php
		include './templates/header.php';
	?>

	<?php
		if(
			!isset($_GET['email']) || !isset($_GET['email-repeat']) || !isset($_GET['phone']) ||
			!isset($_GET['message-title']) || !isset($_GET['message']) || !isset($_GET['mjesto']) ||
			!isset($_GET['postanski-broj'])
		) {
			die('Insufficient data');
		}
		
		function echo_input($field_name, $input_name, $value_field, $condition, $show_error_and_valid) {
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
'                                       <input name="' . $input_name . '" id="email-input" type="mail" class="contact-input" value="' . $value_field . '"></input>' . "\n" .
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
		
		/*
		var_dump($is_email_valid);
		var_dump($is_email_repeat_valid);
		var_dump($is_phone_valid);
		var_dump($is_message_title_valid);
		var_dump($is_message_valid);
		*/
		
		$is_form_data_valid = 
			$is_email_valid && $is_email_repeat_valid && $is_phone_valid && 
			$is_message_title_valid && $is_message_valid;
		
		/*
		echo 'entire form: ';
		var_dump($is_form_data_valid);
		*/
		
		echo '<div class="form-data-container">'; // form data container
		
		if($is_form_data_valid) {
			echo '<h1>Provjerite da li ste tacno popunili formu</h1>';
			
			echo 
				'<form class="form-data" action="send-contact-email.php" method="get">' .
					'<h2>' . 'Unijeti podaci:' . '</h2>' .
					'<span class="form-data-title">' . 'Email: ' . '</span>' . '<span class="form-data-text">' . $email . '</span>' . '<br/>' .
					'<input type="hidden" name="email" value="' . $email . '">' .
					
					'<span class="form-data-title">' . 'Email repeat: ' . '</span>' . '<span class="form-data-text">' . $email_repeat . '</span>' . '<br/>' .
					'<input type="hidden" name="email-repeat" value="' . $email_repeat . '">' .

					'<span class="form-data-title">' . 'Phone: ' . '</span>' . '<span class="form-data-text">' . $phone . '</span>' . '<br/>' .
					'<input type="hidden" name="phone" value="' . $phone . '">' .					
					
					'<span class="form-data-title">' . 'Message title: ' . '</span class="form-data-text">' . '<span>' . $message_title . '</span>' . '<br/>' .
					'<input type="hidden" name="message-title" value="' . $message_title . '">' .
					
					'<span class="form-data-title">' . 'Message: ' . '</span>' . '<span class="form-data-text">' . $message . '</span>' . '<br/>' .
					'<input type="hidden" name="message" value="' . $message . '">' .
					
					
					'<span class="form-data-title">' . 'Mjesto: ' . '</span>' . '<span class="form-data-text">' . $mjesto . '</span>' . '<br/>' .
					'<input type="hidden" name="mjesto" value="' . $mjesto . '">' .					
					
					'<span class="form-data-title">' . 'Postanski broj: ' . '</span>' . '<span class="form-data-text">' . $postanski_broj . '</span>' .
					'<input type="hidden" name="postanski-broj" value="' . $postanski_broj . '">' .					
					
					'<h2>' . 'Da li ste sigurni da zelite poslati ove podatke?' . '</h2>' .
					'<button type="submit">Siguran sam</button>' .
				'</form>';
				
			echo
				'<h2>' . 'Ako ste pogresno popunili formu mozete prepraviti podatke ispod: ' . '</h2>';
		}
		
		echo 
			'<form method="get">';
			
		echo_input('Your email: ', 'email', $email, $is_email_valid, !$is_form_data_valid);
		echo_input('Repeat your email: ', 'email-repeat', $email_repeat, $is_email_repeat_valid, !$is_form_data_valid);
		echo_input('Your phone: ' , 'phone', $phone, $is_phone_valid, !$is_form_data_valid);
		echo_input('Message title: ', 'message-title', $message_title, $is_message_title_valid, !$is_form_data_valid);
		echo_input('Message: ', 'message', $message, $is_message_valid, !$is_form_data_valid);
		echo_input('Mjesto: ', 'mjesto', $mjesto, FALSE, FALSE);
		echo_input('Postanski broj: ', 'postanski-broj', $postanski_broj, FALSE, FALSE);
		
		echo 
			'<button type="submit">Send</button>';
		
		echo 
			'</form>';
			
		echo '</div">'; // endof form data container
	?>

	<?php
		include './templates/footer.php';
	?>