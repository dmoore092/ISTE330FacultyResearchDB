<?php
    include_once 'classes/Project.PDO.class.php';
    include_once 'classes/User.PDO.class.php';
    $projectID = $db->getProjectbyId(1);
    var_dump($projectID);
?>