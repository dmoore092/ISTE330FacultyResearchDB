<?php $page = "findProject"; $title = "Find Projects";
  
  include "assets/inc/header.inc.php";

  session_name("user");
  session_start();

  include_once "assets/inc/nav.php";
  include_once "classes/Project.PDO.class.php";
  $projectDB = new ProjectDB();

  echo "<h1 class='title'>Find Projects</h1>";

  if(isset($_SESSION['loggedIn']) && $_SESSION['loggedIn']){

    if(isset($_GET['logout'])) {
      $projectDB->logout();
    }

    if(isset($_SESSION['loggedIn'])){
        $data = $projectDB->getEverythingAsObjects("project", "Project");
        echo $projectDB->getProjectsAsTable(false, $data);
    }
  }else{
    echo "<p>I am a member of the general public.</p>";
    echo $projectDB->getProjectsAsTable();
  }

  include_once 'assets/inc/footer.php';
?>

