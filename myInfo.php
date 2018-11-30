<?php 
    $title = "My Information"; 
    $page = "myInfo";

    include "assets/inc/header.inc.php";
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

    <form class="infoForm" action="" method="GET">
        <div class="myinfo-form">
            <label>Name: </label>
            <output type="text" name="name">
            <label>Username: </label>
            <output type="text" name="username">
            <label>Title: </label>
            <output type="text" name="title">
            <label>Tagline: </label>
            <output type="text" name="tagline">
            <label>Interst Area: </label>
            <output type="text" name="interestArea">
            <label>Office: </label>
            <output type="text" name="office">
            <label>Website: </label>
            <output type="text" name="wesbite">
            <label>Phone: </label>
            <output type="text" name="phone">
            <label>Email: </label>
            <output type="text" name="email">
        </div>
    </form>
</main>

name, username, tagline, title, interestArea, office, website, phone, email

<?php
  include_once 'assets/inc/footer.php';
?>