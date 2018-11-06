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
		
		/**
		 * getProjectById() - gets the indicated project by selecting it's ID from the database
		 */
		function getProjectById($projectID){

		}

		/**
		 * getProjectsByFacultyName - gets all the projects associated with the indicated faculty member
		 */
		function getProjectsByFacultyName($fName){

		}

		/**
		 * getProjectsByProjectName - allows a user to search for a specfic project, returns items from the database that may match that project
		 */
		function getProjectsByProjectName($pName){

		}

		/**
		 * inertProject() - inserts a new project into the database
		 */
		function insertProject($projectName, $projectLead, $projectDesc, $facultyID){

		}

		/**
		 * updateProject() - Takes in an associative array where the key is the field name and the value is the value to be updated for that field, then updates them
		 */
		function updateProject($updateArray){

		}

	}  
?>