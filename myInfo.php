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
            $updateArray = array();
            if(isset($_POST['id'])){
                $updateArray['id'] = $_POST['id'];
                if(isset($_POST['name'])){
                    if($userDB->isAlphaNumeric($_POST['name']) != 0){
                        $updateArray['name'] = $userDB->sanitize($_POST['name']);
                    }
                }
                if(isset($_POST['username'])){
                    if($userDB->isAlphaNumeric($_POST['username']) != 0){
                        $updateArray['username'] = $userDB->sanitize($_POST['username']);
                    }
                }
                if(isset($_POST['title'])){
                    if($userDB->isAlphaNumeric($_POST['title']) != 0){
                        $updateArray['title'] = $userDB->sanitize($_POST['title']);
                    }
                }
                if(isset($_POST['tagline'])){
                    if($userDB->isAlphaNumeric($_POST['tagline']) != 0){
                        $updateArray['tagline'] = $userDB->sanitize($_POST['tagline']);
                    }
                }
                if(isset($_POST['interestArea'])){
                    if($userDB->isAlphaNumeric($_POST['interestArea']) != 0){
                        $updateArray['interestArea'] = $userDB->sanitize($_POST['interestArea']);
                    }
                }
                if(isset($_POST['office'])){
                    if($userDB->isAlphaNumeric($_POST['office']) != 0){
                        $updateArray['office'] = $userDB->sanitize($_POST['office']);
                    }
                }
                if(isset($_POST['website'])){
                    if($userDB->isValidWebsite($_POST['website']) != 0){
                        $updateArray['website'] = $userDB->sanitize($_POST['website']);
                    }
                }
                if(isset($_POST['phone'])){
                    if($userDB->isValidPhone($_POST['phone']) != 0){
                        $updateArray['phone'] = $userDB->sanitize($_POST['phone']);
                    }
                }
                if(isset($_POST['email'])){
                    if($userDB->isValidEmail($_POST['email']) != 0){
                        $updateArray['email'] = $userDB->sanitize($_POST['email']);
                    }
                }
                $userDB->updateUser($updateArray);
            }
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