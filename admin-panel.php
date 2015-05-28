<?php
	require('db-data.php');

	session_start();
	if(isset($_SESSION['username'])) {
		// vec ulogiran eheh
		
	} else if(!isset($_POST['username']) || !isset($_POST['password'])) {
		die('Insufficient data.');
	} else {
		$request_username = $_POST['username'];
		$request_password = $_POST['password'];
		
		try {
			$conn = new PDO('mysql:dbname=' . $dbname . ';host=' . $hostname, $username, $password);
			$conn->exec('set names utf8');
		} catch(PDOException $ex) {
			die('Greska zbazom :D');
		}
		
		$korisniciSelectQuery = 
			'SELECT 
				*
			FROM
				tblkorisnici
			WHERE
				username = :username';
		$preparedStatementKorisnici = $conn->prepare($korisniciSelectQuery, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
		$preparedStatementKorisnici->execute(array('username' => $request_username));
		$korisnici = $preparedStatementKorisnici->fetchAll();
		
		//var_dump($korisnici);
		//var_dump($request_password);
		//var_dump( md5($request_password) );
		
		if(count($korisnici) === 0) {
			die('Netacni login podaci');
		}
		
		if($korisnici[0]['password'] == md5($request_password)) {
			$_SESSION['username'] = $korisnici[0]['username'];
		} else {
			die('Netacni login podaci.');
		}
	}
?>

<!doctype html>
<html>

<head>
	<meta charset="utf-8" />
	<link rel="stylesheet" href="styles/common.css" />
	<link rel="stylesheet" href="styles/rows.css" />
	<link rel="stylesheet" href="styles/cols.css" />
	<link rel="stylesheet" href="styles/index.css" />
	<link rel="stylesheet" href="styles/tables.css" />
	<link rel="stylesheet" href="styles/links.css" />
	<link rel="stylesheet" href="styles/contact.css" />
	<title>Homepage</title>
</head>

<body>

<div id="el-13" class="container">
	
	<!-- ============LOGO========== -->
	<div id="el-14" class="row row-15">
		<a href="index.php">	
			<div id="el-15" class="col col-60 logo-container">
			</div>
		</a>
	</div>
	<!-- ============endofLOGO========== -->
	
	
	<!-- ============MENU========== -->
	<div id="el-16" class="row row-15 main-menu-container">
		<div class="row row-20">
		</div>
		
		<div class="row row-70">
			<div id="el-17" class="col col-10">
			</div>

			<div id="el-18" class="col col-10 main-menu-item">
				<a onclick="loadPage('index.php');">&lt;Home&gt;</a>
			</div>
			
			<div id="el-19" class="col col-10 main-menu-item">
				<a onclick="loadPage('tables.php');">&lt;Tables&gt;</a>
			</div>
			
			<div id="el-20" class="col col-10 main-menu-item">
				<a onclick="loadPage('links.php');">&lt;Links&gt;</a>
			</div>
			
			<div id="el-21" class="col col-10 main-menu-item">
				<a onclick="loadPage('contact.php');">&lt;Contact&gt;</a>
			</div>
			
			<div id="el-22" class="col col-5">
			</div>
			
			<div id="el-23" class="col col-10 main-menu-item">
				<?php
					if(!isset($_SESSION['username'])) {
				?>
				<a href="admin-login.php">&lt;Login&gt;</a>
				<?php
					} else {
				?>
				<a href="admin-panel.php">&lt;Admin&gt;</a>
				<?php
					}
				?>
			</div>
			
			<div id="el-24" class="col col-10 main-menu-item">
				<a href="logout.php">&lt;Logout&gt;</a>
			</div>
			
			<div id="el-22" class="col col-10">
				<input class="search-box" type="text" onclick="showSearch();" onblur="hideSearch();"></input>
				
				<div class="search-help-row invisible">asd</div>
				<div class="search-help-row invisible">asd</div>
				<div class="search-help-row invisible">asd</div>
				<div class="search-help-row invisible">asd</div>
			</div>
			
			<div id="el-22" class="col col-10 main-menu-item ">
				<div class="col col-25">
					<img class="search-icon-image" src="images/search-icon.png">
				</div>
				
				<div class="col col-75">
					Search
				</div>
				
			</div>
			
			<div class="row row-10">
			</div>
		</div>
	</div>	
	
	<!-- ============endof MENU========== -->
	
	<div id="ointaner-co" class="container">
		

<div id="el-31" class="row row-70 el-31">
	<div id="el-32" class="col col-15 el-32">
		left
	</div>

	
	<div id="el-33" class="col col-70 el-33">
	
		<?php
			// red checkk -- nwm
			if(isset($_SESSION['username'])) {
		?>	
			<div class="simple-bordered-container">
			<hr/>
			<h1>Vijesti</h1>
		
			<h2>Dodavanje vijesti</h2>
			<form action="dodaj-vijest.php" method="post">
				Naslov vijesti: <input type="text" name="naslov-vijesti"> <br/> <br/>
				URL slike: <input type="text" name="url-slike"> <br/> <br/>
				Tekst vijesti: <textarea rows="10" cols="100" name="text-vijesti"></textarea> <br/>
				Detalji vijesti: <textarea rows="10" cols="100" name="detalji-vijesti"></textarea> <br/>
				<input type="submit" value="Dodaj">
			</form>
			
			<h2>Editovanje vijesti</h2>
			<form action="edituj-vijest.php" method="post">
				Izaberi vijest:
				<select name="id-vijesti">
					<?php
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
						
						foreach($news as $new) {
							echo '<option name="id-vijesti" value="' . $new['id'] . '">' . $new['naslov'] . '</option>' . "\n";
						}
					?>
				</select>
				
				<input type="submit" value="Edituj">
			</form>
			
			<h2>Brisanje vijesti</h2>
			<form action="obrisi-vijest.php" method="post">
				Izaberi vijest:
				<select name="id-vijesti">
					<?php
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
						
						foreach($news as $new) {
							echo '<option name="id-vijesti" value="' . $new['id'] . '">' . $new['naslov'] . '</option>' . "\n";
						}
					?>
				</select>
				
				<input type="submit" value="Brisi">
			</form>
			</div>
			
			<div class="simple-bordered-container">
			<hr/>
			<h1>Komentari</h1>
			
			<h2>Brisanje komentara</h2>
			<form action="obrisi-komentar.php" method="post">
				Izaberi vijest:
				<select name="id-vijesti">
					<?php
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
						
						foreach($news as $new) {
							echo '<option name="id-vijesti" value="' . $new['id'] . '">' . $new['naslov'] . '</option>' . "\n";
						}
					?>
				</select>
				
				<input type="submit" value="Brisi">
			</form>
			</div>
			
			<div class="simple-bordered-container">
			<hr/>
			<h1>Korisnici</h1>
		
			<h2>Dodavanje korisnika</h2>
			<form action="dodaj-korisnika.php" method="post">
				Ime: <input type="text" name="ime-korisnika"> <br/>
				Prezime: <input type="text" name="prezime-korisnika"> <br/>
				Username: <input type="text" name="username-korisnika"> <br/>
				Password: <input type="password" name="password-korisnika"> <br/>
				Email: <input type="text" name="email-korisnika"> <br/>
				<input type="submit" value="Dodaj">
			</form>
			
			<h2>Editovanje korisnika</h2>
			<form action="edituj-vijest.php" method="post">
				Izaberi vijest:
				<select name="id-vijesti">
					<?php						
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
						
						foreach($news as $new) {
							echo '<option name="id-vijesti" value="' . $new['id'] . '">' . $new['naslov'] . '</option>' . "\n";
						}
					?>
				</select>
				
				<input type="submit" value="Edituj">
			</form>
			
			<h2>Brisanje korisnika</h2>
			<form action="obrisi-vijest.php" method="post">
				Izaberi vijest:
				<select name="id-vijesti">
					<?php
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
						
						foreach($news as $new) {
							echo '<option name="id-vijesti" value="' . $new['id'] . '">' . $new['naslov'] . '</option>' . "\n";
						}
					?>
				</select>
				
				<input type="submit" value="Brisi">
			</form>
			</div>
		<?php
			}
		?>
	
	</div>

	<div id="el-42" class="col col-15 el-42">
		right
	</div>
</div>

</div>

</div>
	
</div>
<footer>
	<script src="scripts/common.js"></script>
		<script src="scripts/validation.js"></script>
	<script src="scripts/contact.js"></script>
	<script src="scripts/tables.js"></script>
</footer>

</body>

</html>
