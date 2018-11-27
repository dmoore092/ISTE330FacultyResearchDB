<?php $page = "findProject"; 

      include "assets/inc/header.inc.php";
?>
<?php

  session_name("user");
  session_start();

  include_once "assets/inc/nav.php";
  include_once "classes/Project.PDO.class.php";
  $projectDB = new ProjectDB();

  echo "<h1 class='title'>Find Projects</h1>";

  if(isset($_SESSION['loggedIn']) && $_SESSION['loggedIn']){

    if (isset($_GET['logout'])) {
      $projectDB->logout();
    }

    switch($_SESSION['role']){
      case 1:
        echo "<h1>I am a professor.</h1>";
        $data = $projectDB->getEverythingAsObjects("project", "Project");
        echo $projectDB->getProjectsAsTable(true, $data);
      break;
      case 2:
        echo "<h1>I am a student.</h1>";
        $data = $projectDB->getEverythingAsObjects("project", "Project");
        echo $projectDB->getProjectsAsTable(false, $data);
      break;
    }

  }else{
    echo "<p>I am a member of the general public.</p>";
    echo $projectDB->getProjectsAsTable();
  }

?>

<?php
  include_once 'assets/inc/footer.php';
?>

