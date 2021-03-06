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

<body  onload="loadPage('index.php');">

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
					session_start();
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
