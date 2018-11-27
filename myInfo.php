<?php $title = "My Info"; $page = "myInfo"; ?>
<!DOCTYPE HTML>
<html>
<head>
  <title>My Information</title>
  <?php
    include_once 'assets/inc/header.php';
    $DB = new DB();
    if (isset($_GET['logout'])) {
      $DB->logout();
    }
  ?>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <?php
        include_once 'assets/inc/nav.php';
    ?>
<h1 class="title">My Information</h1>


<?php
  include_once 'assets/inc/footer.php';
?>
</body>
</html>
