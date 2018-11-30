<?php 
    session_name("user");
    session_start();
    $title = "My Information"; 
    $page = "myInfo";

    include "assets/inc/header.inc.php";
    
    include_once "classes/User.PDO.class.php";
    include_once 'assets/inc/nav.php';

    $userDB = new UserDB();
    echo "<h1 class='title'>My Info</h1>";
    if(isset($_SESSION['loggedIn']) && $_SESSION['loggedIn']) {
        
        if (isset($_GET['logout'])) {
          $userDB->logout();
        }

        if(isset($_POST['updateUserInfo'])) {



        }

        switch($_SESSION['role']) {
          case 1:
            echo $userDB->getMyInfo(true, $_SESSION['id']);
          break;
          case 2:
          echo $userDB->getMyInfo(false, $_SESSION['id']);
          break;
        }
      } else {
          echo "<h2 id='nologin'>You must be logged in to see your info</h2>";
          echo "<a href='login.php' class='redirect-link'>Login</a>'";
        //header("Location: ./login.php");
      }
      echo "</main>";
?>



<?php
  include_once 'assets/inc/footer.php';
?>