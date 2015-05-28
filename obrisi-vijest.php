<?php
	require('db-data.php');
	
	session_start();
	if(!isset($_SESSION['username'])) {
		die('Not an admin. brrr');
	} else {
		try {
			$conn = new PDO('mysql:dbname=' . $dbname . ';host=' . $hostname, $username, $password);
			$conn->exec('set names utf8');
		} catch(PDOException $ex) {
			die('Greska');
		}
		
		$vijestSelectQuery = 
			'delete 
			from
				tblnovosti
			where
				id = :id_vijesti;';
		$preparedStatementVijesti = $conn->prepare($vijestSelectQuery, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
		$preparedStatementVijesti->execute(
			array(
				':id_vijesti' => htmlspecialchars($_POST['id-vijesti'], ENT_QUOTES) 
			)
		);
		
		echo 'Obrisana';
?>
	<a href="admin-panel.php">Admin panel</a>
<?php
	}
?>