<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title>Royal St. George's College – Library</title>

  <link rel="stylesheet" href="css/styles.css?v=1.0">

  <!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>

<body>
  <script src="js/scripts.js"></script>
  <h1>Adding a book</h1>
  
  <?php
  // set database connection parameters
  $host = "127.0.0.1";
  $user = "rsgc_wrana_m";
  $pass = "";
  $db = "library";
  $port = 3306;
  
  //echo htmlspecialchars($_POST['title']);
  
  // establish the connection
  $connection = mysqli_connect($host, $user, $pass, $db, $port) or die(mysql_error());
  
  // And now perform simple query – make sure it's working
  $query = "INSERT INTO book (title) VALUES ('" . htmlspecialchars($_POST['title']) . "');";
  
  // Check to see if query succeeded
  if (mysqli_query($connection, $query)) {
      echo "<p>Success! The book " . htmlspecialchars($_POST['title']) . "was added to the database.</p>";
  } else {
      echo "<p>Uh oh! The book " . htmlspecialchars($_POST['title']) . " could not be added to the database.</p>";
  }
  
  ?>

</body>
</html>