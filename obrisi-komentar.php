<?php
	require('db-data.php');
	session_start();
	
	if(!isset($_SESSION['username'])) {
		die('not an admin avrr...');
	} else if(!isset($_REQUEST)) {
		die('insufficient data.');
	}
	
	if(isset($_POST['delete-action'])) {
		try {
			$conn = new PDO('mysql:dbname=' . $dbname . ';host=' . $hostname, $username, $password);
			$conn->exec('set names utf8');
		} catch(PDOException $ex) {
			die('Greska');
		}

		$komentarSelectQuery = 
			'delete from
				tblkomentari
			where
				id = :komentar_id';
		$preparedStatementKomentari = $conn->prepare($komentarSelectQuery, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
		$preparedStatementKomentari->execute(array(':komentar_id' => $_POST['delete-action']));
		
		echo 'Obrisano';
?>
		<a href="admin-panel.php">Admin panel</a>
<?php
	} else {
		try {
			$conn = new PDO('mysql:dbname=' . $dbname . ';host=' . $hostname, $username, $password);
			$conn->exec('set names utf8');
		} catch(PDOException $ex) {
			die('Greska');
		}

		$komentarSelectQuery = 
			'SELECT 
				*
			FROM
				tblkomentari
			where
				novost = :novost_id';
		$preparedStatementKomentari = $conn->prepare($komentarSelectQuery, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
		$preparedStatementKomentari->execute(array(':novost_id' => $_POST['id-vijesti']));
		$komentari = $preparedStatementKomentari->fetchAll();
		
		echo '<h2>' . 'Kliknite dugme pored komentara za brisanje!' . '</h2>';
		
		echo '<form action="obrisi-komentar.php" method="post">';
		foreach($komentari as $komentar) {
			echo $komentar['komentar'];
			echo '<input type="submit" name="delete-action" value="' . $komentar['id'] . '">' . '<br/>';
		}
		echo '</form>';
		
		echo '<a href="admin-panel.php">Admin panel</a>';
	}
?>