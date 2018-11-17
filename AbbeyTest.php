<?php
    include_once 'classes/project.PDO.class.php';
    include_once 'classes/user.PDO.class.php';
    $projectID = $db->getProjectbyId(1);
    var_dump($projectID);
?>