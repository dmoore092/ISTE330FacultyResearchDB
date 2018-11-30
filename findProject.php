<?php $page = "findProject"; $title = "Find Projects";
  
  include "assets/inc/header.inc.php";

  session_name("user");
  session_start();

  include_once "assets/inc/nav.php";
  include_once "classes/Project.PDO.class.php";
  $projectDB = new ProjectDB();

  echo "<h1 class='title'>Find Projects</h1>";

  echo "<p>Hello world</p>";


  if(isset($_SESSION['loggedIn']) && $_SESSION['loggedIn']){

    if(isset($_GET['logout'])) {
      $projectDB->logout();
    }
      
        $data = $projectDB->getEverythingAsObjects("project", "Project");
        echo $projectDB->getProjectsAsTable(false, $data);
    
  }else{
    $data = $projectDB->getEverythingAsObjects("project", "Project");
    echo $projectDB->getProjectsAsTable(false, $data);
  }

  include_once 'assets/inc/footer.php';
?>

