<?php $page = "findProject"; $title = "Find Projects";
  
  include "assets/inc/header.inc.php";

  session_name("user");
  session_start();

  include_once "assets/inc/nav.php";
  include_once "classes/Project.PDO.class.php";
  $projectDB = new ProjectDB();

  echo "<h1 class='title'>Find Projects</h1>";

  echo "<form> 
          <div id='search-container'>
            <input type='text' id='custId' name='custId' placeholder='Search here'>
            <input id = 'btn-search' type='submit' value='Submit'>
          </div> 
        </form>";


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

