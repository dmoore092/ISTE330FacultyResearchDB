<?php 
    session_name("user");
    session_start();
    $title = "My Information"; 
    $page = "myInfo";

    include "assets/inc/header.inc.php";
    
    include_once "classes/User.PDO.class.php";
    include_once 'assets/inc/nav.php';

    $userDB = new UserDB();

    if(isset($_SESSION['loggedIn']) && $_SESSION['loggedIn']) {
        
        if (isset($_GET['logout'])) {
          $userDB->logout();
        }

        if(isset($_POST['updateUserInfo'])) {



        }

        switch($_SESSION['role']) {
          case 1:
            echo "<h1>I am a professor.</h1>";
            echo $userDB->getMyInfo(true, $user);
          break;
          case 2:
          echo "<h1>I am a student.</h1>";
          echo $userDB->getMyInfo(false, $user);
          break;
        }
      } else {
          echo "<h2>Not logged in</h2>";
        //header("Location: ./login.php");
      }
?>
<main>
    <h1 class="title">My Information</h1>
</main>


<?php
  include_once 'assets/inc/footer.php';
?>