<?php $page = "findProject"; $title = "Find Projects";
  
  include "assets/inc/header.inc.php";

  session_name("user");
  session_start();

  include_once "assets/inc/nav.php";
  include_once "classes/Project.PDO.class.php";
  $projectDB = new ProjectDB();

  echo "<h1 class='title'>Find Projects</h1>";

  echo "<form action='findProject.php' method='POST'> 
          <div id='search-container'>
            <input type='text' id='search-box' name='searchVal' placeholder='Search here by project name'>
            <input id= 'btn-search' name='search' type='submit' value='Submit'>
          </div> 
        </form>";


  if(isset($_SESSION['loggedIn']) && $_SESSION['loggedIn']){
    if(isset($_GET['logout'])) {
      $projectDB->logout();
    }
  }

   $data = null;
   if(isset($_POST['search'])){
      if(isset($_POST['searchVal']) && $projectDB->isAlphaNumeric($_POST['searchVal']) != 0){
        $val = $projectDB->sanitize($_POST['searchVal']);
        $data = $projectDB->searchProjects($val);
      }
    }else{
      $data = $projectDB->getEverythingAsObjects("project", "Project");
    }
    echo $projectDB->getProjectsAsTable(false, $data);

  include_once 'assets/inc/footer.php';
?>

