<?php $title = "My Projects"; $page = "findProject";
include "assets/inc/header.inc.php";

session_name("user");
  session_start();
  include_once "assets/inc/nav.php";
  include_once "classes/Project.PDO.class.php";
  $projectDB = new ProjectDB();
  echo "<h1 class='title'>My Projects</h1>";
  if(isset($_SESSION['loggedIn']) && $_SESSION['loggedIn']){
    if (isset($_GET['logout'])) {
      $projectDB->logout();
    }

    if(isset($_POST['updateProject'])){
      $updateArray = array();
      if(isset($_POST['project_id'])){
        $updateArray['project_id'] = $_POST['project_id'];
        
        //Only contine to the other conditionals if there is an ID in the update array
        if(isset($_POST['project_name'])){
          if($projectDB->isAlphanumeric($_POST['project_name']) != 0){
            $updateArray['project_name'] = $projectDB->sanitize($_POST['project_name']);
          }
        }
        if(isset($_POST['project_lead'])){
          if($projectDB->isAlphanumeric($_POST['project_lead']) != 0){
            $updateArray['project_lead'] = $projectDB->sanitize($_POST['project_lead']);
          }
        }
        if(isset($_POST['project_desc'])){
          if($projectDB->isAlphanumeric($_POST['project_desc']) != 0){
            $updateArray['project_desc'] = $projectDB->sanitize($_POST['project_desc']);
          }
        }
      }
      $projectDB->updateProject($updateArray);
    }

    if(isset($_POST['deleteProject'])){
      if(isset($_POST['project_id'])){
        $projectDB->delete('project', $_POST['project_id']);
      }
    }

    switch($_SESSION['role']){
      case 1:
        $data = $projectDB->getProjectsByUser($_SESSION['fullname']);//change project lead if fails
        echo $projectDB->getProjectsAsTable(true, $data);
      break;
      case 2:
        // echo "<h3 class='title'>You must be a professor to access this page.</h3><br/><a href='find.php'>Find projects.</a>";
        $data = $projectDB->getProjectsByUser($_SESSION['fullname']);
        echo $projectDB->getProjectsAsTable(false, $data);
      break;
    }
  }else{
   echo "<h2 class='title'>You must be logged in to see your projects.<h2><br/><a href='login.php' style='text-align:center'>Login</a>";
  }

  include_once 'assets/inc/footer.php';
?>
