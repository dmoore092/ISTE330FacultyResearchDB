<?php
  session_name("user");
  session_start();

  include "classes/User.PDO.class.php";
  include_once 'assets/inc/nav.php';

  //set it as false first
  $isLoggedIn = 0;

  if(isset($_POST["login"])){
    $username = $_POST["username"];
    $password = $_POST["password"];
    $user = new UserDB();
    //user will equals (0 || false) || (1 || true)
    $isLoggedIn = $user->login($username, $password);
  }

  if(isset($_SESSION['loggedIn']) && $_SESSION['loggedIn']) {
    echo "<h1>Logged in</h1>";
    header("Location: ./myProjects.php");
  }

?>
<!DOCTYPE HTML>
<html>
<head>
  <title>Login</title>
  <link rel="stylesheet" href="assets/css/icons/foundation-icons.css">
  <link rel="stylesheet" href="assets/css/foundation.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/loginStyle.css">
  <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
</head>
<body>
  <h1 class="title">CollaboRIT</h1>
<div id="feedbackUsername">
  <div data-closable class="callout alert-callout-subtle alert">
    <strong>ERROR:</strong> Username or password are incorrect
      <button class="close-button" aria-label="Dismiss alert" type="button" data-close>
        <span aria-hidden="true">⊗</span>
    </button>
  </div>
</div>
<!--<div id="feedbackPassword">
  <div data-closable class="callout alert-callout-subtle alert">
    <strong>ERROR:</strong> Password Required
      <button class="close-button" aria-label="Dismiss alert" type="button" data-close>
        <span aria-hidden="true">⊗</span>
    </button>
  </div>
</div>-->
<form class="loginForm" action="login.php" method="POST">
  <div class="sign-in-form">
    <label for="sign-in-form-username">Username</label>
    <input type="text" class="sign-in-form-username" id="sign-in-form-username" name="username">
    <label for="sign-in-form-password">Password</label>
    <input type="password" class="sign-in-form-password" id="sign-in-form-password" name="password">
    <input type="submit" class="sign-in-form-button" value="Login" name="login"/> 
    <p class="text-center"><a href="#">Forgot your password?</a></p>
    <p class="text-center"><a href="#">Create Account</a></p>
  </div>
</form>
<script>
//    function validateForm() {
      if("<?php echo $isLoggedIn ?>" == "0") {
          document.getElementById("feedbackUsername").style.display = "block";
          //document.getElementById("feedbackPassword").setAttribute("style", "display:block");
      }



    // var username = document.forms["loginForm"]["username"].value;
    // var password = document.forms["loginForm"]["password"].value;
    
    // if (username == "" || username ==  undefined) {
    //   document.getElementById("feedbackUsername").setAttribute("style", "display:block");
    //   return false;
    // }

    // if (password == "" || password == undefined) {
    //   document.getElementById("feedbackPassword").setAttribute("style", "display:block");

    //   return false;
    // }
    
    // return true;

  </script>

  <script src="assets/scripts/vendor/jquery.js"></script>
  <script src="assets/scripts/vendor/what-input.js"></script>
  <script src="assets/scripts/vendor/foundation.js"></script>
  <script src="assets/scripts/app.js"></script>
  <script>$("[data-menu-underline-from-center] a").addClass("underline-from-center");</script>
</body>
</html>
