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
					tblkorisnici
				set 
					name = :name,
					surname = :surname,
					username = :username,
					email = :email
				where 
					id = :id_korisnika';
			$preparedStatementVijesti = $conn->prepare($vijestSelectQuery, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
			$preparedStatementVijesti->execute(
				array(
					':id_korisnika' => htmlspecialchars($_POST['id-korisnika'], ENT_QUOTES), 
					':name' => htmlspecialchars($_POST['ime-korisnika'], ENT_QUOTES), 
					':surname' => htmlspecialchars($_POST['prezime-korisnika'], ENT_QUOTES), 
					':username' => htmlspecialchars($_POST['username-korisnika'], ENT_QUOTES), 
					':email' => htmlspecialchars($_POST['email-korisnika'], ENT_QUOTES)
				)
			);
?>
			Korisnik editovan.
			<a href="admin-panel.php">Admin panel</a>
<?php
		} else {
			var_dump($_REQUEST);
			try {
				$conn = new PDO('mysql:dbname=' . $dbname . ';host=' . $hostname, $username, $password);
				$conn->exec('set names utf8');
			} catch(PDOException $ex) {
				die('Greska');
			}
			
			$vijestSelectQuery = 
				'SELECT 
					*
				FROM
					tblkorisnici
				where
					id = :id_korisnika';
			$preparedStatementVijesti = $conn->prepare($vijestSelectQuery, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
			$preparedStatementVijesti->execute(
				array(
					':id_korisnika' => htmlspecialchars($_POST['id-korisnika'], ENT_QUOTES) 
				)
			);
			$news = $preparedStatementVijesti->fetchAll();
?>

	<h2>Editovanje vijesti</h2>
	<form action="edituj-korisnika.php" method="post">
		<input type="hidden" name="page-action" value="edit">
		<input type="hidden" name="id-korisnika" value="<?=$news[0]['id']?>">
		Ime: <input type="text" name="ime-korisnika" value="<?=$news[0]['name']?>"> <br/> <br/>
		Prezime: <input type="text" name="prezime-korisnika" value="<?=$news[0]['surname']?>"> <br/> <br/>
		Username: <input type="text" name="username-korisnika" value="<?=$news[0]['username']?>"> <br/> <br/>
		Email: <input type="text" name="email-korisnika" value="<?=$news[0]['email']?>"> <br/> <br/>
		<input type="submit" value="Edituj">
	</form>

<?php
		}
	} else {
		echo 'not an admin... :( :( :( ';
	}
?>