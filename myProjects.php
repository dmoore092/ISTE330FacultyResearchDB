<?php

session_name("user");
  session_start();
  include_once "assets/inc/nav.php";
  include_once "classes/Project.PDO.class.php";
  $projectDB = new ProjectDB();
  echo "<h1 class='title'>Find Projects</h1>";
  if(isset($_SESSION['loggedIn']) && $_SESSION['loggedIn']){
    switch($_SESSION['role']){
      case 1:
        echo "<h1>I am a professor.</h1>";
        echo $projectDB->getProjectsAsTable(true);
      break;
      case 2:
        echo "<h1>I am a student.</h1>";
        echo $projectDB->getProjectsAsTable();
      break;
    }
  }else{
   echo "<p>You must be logged in to see your projects.<p><br/><a href='login.php'>Login</a>";
  }

?>
<!DOCTYPE HTML>
<html>
<head>
  <title>My Projects</title>
  <?php
    include_once 'assets/inc/header.php';
  ?>
</head>
<body>
    <?php
        include_once 'assets/inc/nav.php';
    ?>
<h1 class="title">My Projects</h1>

<?php
  include_once 'assets/inc/footer.php';
?>
</body>
</html>
