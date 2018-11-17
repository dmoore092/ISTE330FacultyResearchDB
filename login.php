<?php
  include "User.PDO.class.php";
  include_once 'assets/inc/nav.php';

  if(isset($_POST["username"]) && isset($_POST['password'])) {
    $username = $_POST["username"];
    $password = $_POST["password"];

    $user = new UserDB();
    if($user->login($username, $password)) {
      header("Location: ./myProjects.php");
    } else {
        echo "<h1> ERROR: Invalid credentials </h1>";
    }
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
</head>
<body>
  <h1 class="title">CollaboRIT</h1>
<form class="loginForm" action="login.php" method="POST">
  <div class="sign-in-form">
    <label for="sign-in-form-username">Username</label>
    <input type="text" class="sign-in-form-username" id="sign-in-form-username" name="username">
    <label for="sign-in-form-password">Password</label>
    <input type="text" class="sign-in-form-password" id="sign-in-form-password" name="password">
    <button type="submit" class="sign-in-form-button">Login</button>
    <p class="text-center"><a href="#">Forgot your password?</a></p>
    <p class="text-center"><a href="#">Create Account</a></p>
  </div>
</form>


  <script src="assets/scripts/vendor/jquery.js"></script>
  <script src="assets/scripts/vendor/what-input.js"></script>
  <script src="assets/scripts/vendor/foundation.js"></script>
  <script src="assets/scripts/app.js"></script>
  <script>$("[data-menu-underline-from-center] a").addClass("underline-from-center");</script>
</body>
</html>
