<?php
	
	if(!isset($_REQUEST)) {
		die();
	} else {
		$novost_id = htmlspecialchars($_REQUEST['novost-id'], ENT_QUOTES, 'UTF-8');
		$autor = htmlspecialchars($_REQUEST['autor'], ENT_QUOTES, 'UTF-8');
		$email = htmlspecialchars($_REQUEST['email-autora'], ENT_QUOTES, 'UTF-8');
		$comment_text = htmlspecialchars($_REQUEST['comment-text'], ENT_QUOTES, 'UTF-8');
	
		var_dump($_REQUEST);
	
		$hostname = 'localhost';
		$username = 'maruk';
		$password = 'fustafic';
		$dbname = 'eart';

		try {
			$conn = new PDO('mysql:dbname=' . $dbname . ';host=' . $hostname, $username, $password);
			$conn->exec('set names utf8');
		} catch(PDOException $ex) {
			die('Greska');
		}

		$komentariSelectQuery = 
			'INSERT INTO 
				tblkomentari
					(email, autor, komentar, datum, novost)
			VALUE
				(:email, :autor, :komentar, :datum, :novost)';
		$preparedStatementKomentari = $conn->prepare($komentariSelectQuery, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
		$preparedStatementKomentari->execute(array('email' => $email, 'autor' => $autor, 'komentar' => $comment_text, 'datum' => date('now'), 'novost' => $novost_id));

		header('Location: /e-art/index.php');
	}
?>
