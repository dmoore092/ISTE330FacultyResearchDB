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
		function getProjectsByFacultyName($fullname){
			try{
                $data = array();
                $stmt = $this->dbConn->prepare("select * from project where projectLead = :fullname"); 
                $stmt->bindParam("fullname",$fullname,PDO::PARAM_STR, 150);    
                var_dump($stmt);
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
		var_dump($updateArray);
		$id = '';
            foreach($updateArray as $key=>$val){
                switch($key){
                    case "project_id": // case will be the name of the form field the user types in
                        $id = $val;
                        break;
                    case 'project_name':
			echo "<h2>Calling update field for the project name.</h2>";
                        echo $this->updateField('project', 'projectName', $val, $id);
                        break;
                    case 'project_lead':
                        $this->updateField('project', 'projectLead', $val, $id);
                        break;
                    case 'project_desc':
                        $this->updateField('project', 'projectDescription', $val, $id);
                        break;
                }
            }
	}  
        function getProjectsAsTable($editable=false, $data=null){
            //$data = $this->getEverythingAsObjects("project", "Project");
            if($data != null && count($data) > 0){
                $html = "<table>\n";
                if($editable){
                    $html .= "<tr><th>Project Name</th><th>Project Lead</th><th>Project Description</th><th></th></tr>";
                    foreach($data as $project){
                        $html .= "<form action= 'findProject.php' method='post'>
                        <tr>
                            <input type='hidden' name='project_id' value='{$project->getId()}'/>
                            <td><input type='text' name='project_name' placeholder='{$project->getProjectName()}'/></td>
                            <td><input type='text' name='project_lead' placeholder='{$project->getProjectLead()}'/></td>
                            <td><input type='text' name='project_desc' placeholder='{$project->getDescription()}'/></td>
                            <td>
                                <input type='submit' name='updateProject' value='Update'/>
                                <input type='submit' name='deleteProject' value='Delete'/>
                            </td>
                        </tr></form>\n";
                    }
                }else{
                    $html .= "<tr><th>Project Name</th><th>Project Lead</th><th>Project Description</th></tr>";
                    foreach($data as $project){
                        $html .= "<tr>
                            <td>{$project->getProjectName()}</td>
                            <td>{$project->getProjectLead()}</td>
                            <td>{$project->getDescription()}</td>
        
                        </tr>";
                    }
                }
                $html .= "</table>";
            }else{
                $html = "<p>No projects exist.</p>";
            }
            return $html;
        }
	}  
?>
