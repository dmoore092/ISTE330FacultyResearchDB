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
			try{
                $data = array();
                $stmt = $this->dbConn->prepare("select * from project where id = :projectID"); 
                $stmt->bindParam("projectID",$projectID,PDO::PARAM_INT);    
                $stmt->execute();
                $stmt->setFetchMode(PDO::FETCH_CLASS,"Project");
                while($databaseProject = $stmt->fetch()){
                    $data[] = $databaseProject;
                }
                return $data;
            }
            catch(PDOException $e){
                echo $e->getMessage();
                throw new Exception("Problem getting Project from database.");
            }
		}

		/**
		 * getProjectsByFacultyName - gets all the projects associated with the indicated faculty member
		 */
		function getProjectsByFacultyName($fName){
			try{
                $data = array();
                $stmt = $this->dbConn->prepare("select * from project where projectLead = :fName"); 
                $stmt->bindParam("fName",$fName,PDO::PARAM_STR, 150);    
                $stmt->execute();
                $stmt->setFetchMode(PDO::FETCH_CLASS,"Project");
                while($databaseProjects = $stmt->fetch()){
                    $data[] = $databaseProjects;
                }
                return $data;
            }
            catch(PDOException $e){
                echo $e->getMessage();
                throw new Exception("Problem getting Projects by faculty from database.");
            }
		}

		/**
		 * getProjectsByProjectName - allows a user to search for a specfic project, returns items from the database that may match that project
		 */
		function getProjectsByProjectName($pName){
			try{
                $data = array();
                $stmt = $this->dbConn->prepare("select * from project where projectName = :pName"); 
                $stmt->bindParam("fName",$fName,PDO::PARAM_STR, 150);    
                $stmt->execute();
                $stmt->setFetchMode(PDO::FETCH_CLASS,"Project");
                while($databaseProjects = $stmt->fetch()){
                    $data[] = $databaseProjects;
                }
                return $data;
            }
            catch(PDOException $e){
                echo $e->getMessage();
                throw new Exception("Problem getting Projects by name from database.");
            }
		}

		/**
		 * inertProject() - inserts a new project into the database
		 */
		function insertProject($projectName, $projectLead, $projectDesc, $facultyID){
            $ra = -1;
            try{
                $query = "INSERT INTO project(:projectName,:projectLead,:projectDesc,:facultyID)";
                $stmt = $this->dbConn->prepare($query);
                $stmt->bindParam(array(
                    ":projectName"=>$projectName,
                    ":projectLead"=>$projectLead,
                    ":projectDesc"=>$projectDesc,
                    ":facultyID"=>$facultyID
                ));
                $ra = $stmt->execute();
            }catch(PDOException $e){
                return "A problem occurred updating $tableName";
            }
            return $ra;
		}

		/**
		 * updateProject() - Takes in an associative array where the key is the field name and the value is the value to be updated for that field, then updates them
		 */
		function updateProject($updateArray){
			$id = '';
            foreach($updateArray as $key=>$val){
                switch($key){
                    case "project_id": // case will be the name of the form field the user types in
                        $id = $val;
                        break;
                    case 'project_name':
                        $this->updateField('project', 'projectName', $val, $id);
                        break;
                    case 'project_lead':
                        $this->updateField('project', 'projectLead', $val, $id);
                        break;
                    case 'project_description':
                        $this->updateField('project', 'projectDescription', $val, $id);
                        break;
                }
            }
		}

	}  
?>