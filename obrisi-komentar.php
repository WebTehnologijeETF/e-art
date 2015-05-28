<?php
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

	$vijestSelectQuery = 
		'SELECT 
			datum, autor, naslov, urlslike, tekst, detalji, id
		FROM
			tblnovosti
		order by
			datum';
	$preparedStatementVijesti = $conn->prepare($vijestSelectQuery, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
	$preparedStatementVijesti->execute(array());
	$news = $preparedStatementVijesti->fetchAll();
?>