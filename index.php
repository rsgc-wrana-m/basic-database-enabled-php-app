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
  <p>Welcome to the Royal St. George's Library website! Have a nice day.</p>
  <h1>Library Books Available</h1>
  
  <?php
  // set database connection parameters
  $host = "127.0.0.1";
  $user = "rsgc_wrana_m";
  $pass = "";
  $db = "library";
  $port = 3306;
  
  // establish the connection
  $connection = mysqli_connect($host, $user, $pass, $db, $port) or die(mysql_error());
  
  // And now perform simple query – make sure it's working
  $query = "SELECT * FROM book;";
  $result = mysqli_query($connection, $query);
  
  // Iterate over the result set
  echo "<table>";
  echo "<tr>";
  echo "<th>";
  echo "ID";
  echo "</th>";
  echo "<th>";
  echo "Book Title";
  echo "</th>";
  echo "</tr>";
  while ($row = mysqli_fetch_assoc($result)) {
      echo "<tr>";
      echo "<td>";
      echo $row['id'];
      echo "</td>";
      echo "<td>";
      echo $row['title'];
      echo "</td>";
      echo "</tr>";
  }
  echo "</table>";

  ?>
  <h1>Add a title to the library database:</h1>
  <form action="addBookHandler.php" method="post">
    Book title:<br>
    <input type="text" name="title" value="">
    <br>
    <input type="submit" value="Submit">
  </form> 
  <h1>Our Library Patrons Are:</h1>
  <?php
  $connection = mysqli_connect($host, $user, $pass, $db, $port) or die(mysql_error());
  $query = "SELECT * FROM patron";
  $result = mysqli_query($connection, $query);
  echo "<table>";
  echo "<tr>";
  echo "<th>";
  echo "ID";
  echo "</th>";
  echo "<th>";
  echo "First Name";
  echo "</th>";
  echo "<th>";
  echo "Last Name";
  echo "</th>";
  echo "</tr>";
    while ($row = mysqli_fetch_assoc($result)) {
      echo "<tr>";
      echo "<td>";
      echo $row['id'];
      echo "</td>";
      echo "<td>";
      echo $row['firstname'];
      echo "</td>";
      echo "<td>";
      echo $row['lastname'];
      echo "</td>";
      echo "</tr>";
  }
  ?>
  
  
    <h1>Add your m8 to the list</h1>
  <form action="addm8.php" method="post">
    Your m8's Name:<br>
    <input type="text" name="title" value=""><input type="text" name="title" value="">
    <br>
    <input type="submit" value="Submit">

  
</body>
</html>