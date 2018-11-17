<?php
    require_once('classes/project.PDO.class.php');
    require_once('classes/User.PDO.class.php');
    $db = new DB;
    $projectID = $db->getProjectbyId(1);
    var_dump($projectID);  
?>