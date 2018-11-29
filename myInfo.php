<?php $title = "My Information"; $page = "myInfo";

    include_once 'assets/inc/nav.php';
    $DB = new DB();
    if (isset($_GET['logout'])) {
        $DB->logout();
    }

    if(!isset($_SESSION['loggedIn']) || $_SESSION['loggedIn'] == false) {
        header("Location: ./login.php");
      }
?>
<main>
    <h1 class="title">My Information</h1>
</main>



<?php
  include_once 'assets/inc/footer.php';
?>