<?php
	require('db-data.php');
	session_start();
	if(isset($_SESSION['username'])) {
		if(!isset($_REQUEST)) {
			die('insufficient data.');
		}
		
		if(isset($_REQUEST['page-action'])) {
			try {
				$conn = new PDO('mysql:dbname=' . $dbname . ';host=' . $hostname, $username, $password);
				$conn->exec('set names utf8');
			} catch(PDOException $ex) {
				die('Greska');
			}
			
			$vijestSelectQuery = 
				'update 
					tblnovosti
				set 
				
				where 
					';
			$preparedStatementVijesti = $conn->prepare($vijestSelectQuery, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
			$preparedStatementVijesti->execute(
				array(
					':id_vijesti' => htmlspecialchars($_POST['id-vijesti'], ENT_QUOTES) 
				)
			);
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
			
			$vijestSelectQuery = 
				'SELECT 
					datum, autor, naslov, urlslike, tekst, detalji, id
				FROM
					tblnovosti
				where
					id = :id_vijesti
				order by
					datum';
			$preparedStatementVijesti = $conn->prepare($vijestSelectQuery, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
			$preparedStatementVijesti->execute(
				array(
					':id_vijesti' => htmlspecialchars($_POST['id-vijesti'], ENT_QUOTES) 
				)
			);
			$news = $preparedStatementVijesti->fetchAll();
			
			var_dump($news);
?>

	<h2>Editovanje vijesti</h2>
	<form action="edituj-vijest.php" method="post">
		<input type="hidden" name="page-action" value="edit">
		Naslov vijesti: <input type="text" name="naslov-vijesti" value="<?=$news[0]['naslov']?>"> <br/> <br/>
		URL slike: <input type="text" name="url-slike" value="<?=$news[0]['urlslike']?>"> <br/> <br/>
		Tekst vijesti: <textarea rows="10" cols="100" name="text-vijesti"> <?=$news[0]['tekst']?> </textarea> <br/>
		Detalji vijesti: <textarea rows="10" cols="100" name="detalji-vijesti"> <?=$news[0]['detalji']?> </textarea> <br/>
		<input type="submit" value="Edituj">
	</form>

<?php
		}
	} else {
		echo 'not an admin... :( :( :( ';
	}
?>