<?php 
    require_once "PDO.DB.class.php";
    include "User.class.php";
    class UserDB extends DB{
        private $dbConn;

        function __construct(){
            parent::__construct();
            $this->dbConn = $this->getConn();
        }

        
?>