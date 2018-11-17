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
    echo "<p>I am a member of the general public.</p>";
    echo $projectDB->getProjectsAsTable();
    var_dump($projectDB);
  }

?>
<!DOCTYPE HTML>
<html>
<head>
  <title>Find Projects</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

</body>
</html>
