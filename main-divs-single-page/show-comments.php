<!doctype html>
<html>

<head>
	<meta charset="utf-8" />
	<link rel="stylesheet" href="../styles/common.css" />
	<link rel="stylesheet" href="../styles/rows.css" />
	<link rel="stylesheet" href="../styles/cols.css" />
	<link rel="stylesheet" href="../styles/index.css" />
	<link rel="stylesheet" href="../styles/tables.css" />
	<link rel="stylesheet" href="../styles/links.css" />
	<link rel="stylesheet" href="../styles/contact.css" />
	<title>Homepage</title>
</head>

<body>

<?php
	if(!isset($_REQUEST['novost-id'])) {
		die('Nije izabrana novost.');
	} else {
		$novost_id = htmlspecialchars($_REQUEST['novost-id'], ENT_QUOTES, 'UTF-8');
	
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
			'SELECT 
				*
			FROM
				tblkomentari
			WHERE
				novost = :novost_id';
		$preparedStatementKomentari = $conn->prepare($komentariSelectQuery, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
		$preparedStatementKomentari->execute(array('novost_id' => $novost_id));
		$komentari = $preparedStatementKomentari->fetchAll();
		
		echo '<h1>Komentari na vijest:</h1>';
		
		foreach($komentari as $komentar) {
			echo '<div>';
			
			echo '<h3>Autor:</h3>' . $komentar['autor'];
			echo '<h3>Email:</h3>' . $komentar['email'];
			echo '<h3>Datum:</h3>' . $komentar['datum'];
			
			echo '</div>';
		
			echo '<hr/>';
		}
	}
?>

<a href="/e-art/index.php">Back</a>

</body>

</html>