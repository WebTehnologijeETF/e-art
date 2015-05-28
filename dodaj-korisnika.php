<?php
	require('db-data.php');
	session_start();
	
	if(!isset($_SESSION['username'])) {
		die('Not an adminn.');
	} else if(!isset($_REQUEST)) {
		die('insufficient data.');
	}
	
	try {
		$conn = new PDO('mysql:dbname=' . $dbname . ';host=' . $hostname, $username, $password);
		$conn->exec('set names utf8');
	} catch(PDOException $ex) {
		die('Greska zbazom');
	}
	
	$vijestInsertQuery = 
		'insert into
			tblkorisnici
		(name, surname, username, password, email) values
		(:name, :surname, :username, :password, :email)';
	$preparedStatementVijesti = $conn->prepare(
		$vijestInsertQuery, 
		array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY)
	);
	$preparedStatementVijesti->execute(
		array(
			':name' => htmlspecialchars($_POST['ime-korisnika'], ENT_QUOTES),
			':surname' => htmlspecialchars($_POST['prezime-korisnika'], ENT_QUOTES),
			':username' => htmlspecialchars($_POST['username-korisnika'], ENT_QUOTES),
			':password' => md5(htmlspecialchars($_POST['password-korisnika'], ENT_QUOTES)),
			':email' => htmlspecialchars($_POST['email-korisnika'], ENT_QUOTES)
		)
	);
?>
Korisnik dodan.
<a href="admin-panel.php">Admin panel</a>