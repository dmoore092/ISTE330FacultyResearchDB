<?php 
    require_once "PDO.DB.class.php";
    include "Project.class.php";
    class ProjectDB extends DB{
        private $dbConn;

        function __construct(){
            parent::__construct();
            $this->dbConn = $this->getConn();
        }

       
?>