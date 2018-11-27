<!DOCTYPE HTML>
<html>
<head>
  <title><?php echo $title; ?></title>
  <link rel="stylesheet" href="assets/css/icons/foundation-icons.css">
  <link rel="stylesheet" href="assets/css/foundation.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/<?php echo $page ?>Style.css">
  <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
</head>
<body>
    <?php
        include_once 'assets/inc/nav.php';
        include_once 'classes/PDO.DB.class.php';
    ?>