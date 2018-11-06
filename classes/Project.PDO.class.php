<?php 
    require_once "PDO.DB.class.php";
    include "Project.class.php";
	/*
	* ProjectDB class contains all of the methods for using PHP Data Objects to 
	* interface with the database.
	* version 11/6/2018
	*/
    class ProjectDB extends DB{
        private $dbConn;

		/*
		* Constructor for Project PDO calls the parent constructor and obtains the connection
		* using the connection accessor method. This will allow us to use methods in the parent class.
		*/
        function __construct(){
            parent::__construct();
            $this->dbConn = $this->getConn();
        }

	}  
?>