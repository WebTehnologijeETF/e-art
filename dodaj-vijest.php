<?php
	require('db-data.php');
	session_start();
	if(isset($_SESSION['username'])) {
		if(!isset($_REQUEST)) {
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
				tblnovosti
			(autor, naslov, tekst, detalji, datum, urlslike) values
			(:autor, :naslov, :tekst, :detalji, :datum, :urlslike);';
		$preparedStatementVijesti = $conn->prepare(
			$vijestInsertQuery, 
			array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY)
		);
		$preparedStatementVijesti->execute(
			array(
				':autor' => htmlspecialchars($_SESSION['username'], ENT_QUOTES),
				':naslov' => htmlspecialchars($_POST['naslov-vijesti'], ENT_QUOTES),
				':tekst' => htmlspecialchars($_POST['text-vijesti'], ENT_QUOTES),
				':detalji' => htmlspecialchars($_POST['detalji-vijesti'], ENT_QUOTES),
				':datum' => date("Y-m-d H:i:s"),
				':urlslike' => htmlspecialchars($_POST['url-slike'], ENT_QUOTES)
			)
		);
?>
Vijest dodana.
<a href="index.php">Back</a>
<?php
	}
	echo time();
?>