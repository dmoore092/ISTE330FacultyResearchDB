<?php 
	/*
	* Project class contains all of the methods and variables for
	* interacting with a Project object
	* version 11/6/2018
	*/
	class Project{
		private $id;
		private $projectName;
		private $projectLead;
        private $email;
		private $projectDescription;
		
		/**
		 * getId() - returns the Project's ID
		 */
		public function getId(){
			return $this->id;
		}
		
		/**
		 * getProjectName() - returns the Project's name
		 */
		public function getProjectName(){
			return $this->projectName;
		}
		
		/**
		 * getProjectLead() - returns the Project's Lead
		 */
		public function getProjectLead(){
			return $this->projectLead;
		}
		
		/**
		 * getDescription() - returns the Project's Description
		 */
		public function getDescription(){
			return $this->projectDescription;
		}
        
        /**
		 * getEmail() - returns the email
		 */
		public function getEmail(){
			return $this->email;
		}
	}
?>