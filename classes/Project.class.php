<?php 
	class Project{
		private $id;
		private $projectName;
		private $projectLead;
		private $projectDescription;
		
		public function getId(){
			return $this->id;
		}
		
		public function getProjectName(){
			return $this->projectName;
		}
		
		public function getProjectLead(){
			return $this->projectLead;
		}
		
		public function getDescription(){
			return $this->projectDescription;
		}
	}
?>