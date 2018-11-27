<?php $title = "Login"; $page = "login"; 
    include "assets/inc/header.inc.php";

  session_name("user");
  session_start();

  include "classes/User.PDO.class.php";
  include_once 'assets/inc/nav.php';

  //set it as false first
  $isLoggedIn = -1;

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

<div id="feedback">
  <div data-closable class="callout alert-callout-subtle alert">
    <strong>ERROR:</strong> Username or password are incorrect
      <button class="close-button" aria-label="Dismiss alert" type="button" data-close>
        <span aria-hidden="true">⊗</span>
    </button>
  </div>
</div>
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

<?php
  include_once 'assets/inc/validation.php';
  include_once 'assets/inc/footer.php';
?>

