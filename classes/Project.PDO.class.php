<?php 
    require_once "PDO.DB.class.php";
    include "Project.class.php";
    include "User.class.php";
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
		function getProjectsByUser($id){
			try{
                $data = array();
                //$stmt = $this->dbConn->prepare("select distinct projectName, projectLead, email, projectDescription, u.id from project p join user u where p.id = u.id AND u.name = :fullname"); 
                $stmt = $this->dbConn->prepare("call getMyProjects($id);");
                $stmt->bindParam("id",$id,PDO::PARAM_STR, 150); 
                $stmt->execute();
                $stmt->setFetchMode(PDO::FETCH_CLASS,"Project");
                while($databaseProjects = $stmt->fetch()){
                    $data[] = $databaseProjects;
                }
                return $data;
            }
            catch(PDOException $e){
                echo $e->getMessage();
                throw new Exception("Problem getting Projects by user from database.");
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
                $query = "INSERT INTO project values(:facultyID,:projectName,:projectLead,:projectDesc)";
                $stmt = $this->dbConn->prepare($query);
                $ra = $stmt->execute(array(
                    ":facultyID"=>$facultyID,
                    ":projectName"=>$projectName,
                    ":projectLead"=>$projectLead,
                    ":projectDesc"=>$projectDesc
                ));
            }catch(PDOException $e){
                return "A problem occurred inserting a new project.";
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
                        echo $this->updateField('project', 'projectName', $val, $id);
                        break;
                    case 'email':
                        echo $this->updateField('project', 'email', $val, $id);
                        break;
                    case 'project_desc':
                        echo $this->updateField('project', 'projectDescription', $val, $id);
                        break;
                }
            }
	}  
	    
        function getProjectsAsTable($editable=false, $data=null){
            //$data = $this->getEverythingAsObjects("project", "Project");
            if($data != null && count($data) > 0){
                $html = "<table>\n";
                if($editable){
                    $html .= "<tr><th>Project Name</th><th>Project Lead</th><th>Email</th><th>Project Description</th><th></th></tr>";
                    foreach($data as $project){
                        $html .= "<form action= 'myProjects.php' method='post'>
                        <tr>
                            <input type='hidden' name='project_id' value='{$project->getId()}'/>
                            <td><input type='text' name='project_name' placeholder='{$project->getProjectName()}'/></td>
                            <td><input type='text' name='project_lead' placeholder='{$project->getProjectLead()}' disabled/></td>
                            <td><input type='text' name='email' placeholder='{$project->getEmail()}'/></td>
                            <td><input type='text' name='project_desc' placeholder='{$project->getDescription()}'/></td>
                            <td>
                                <input type='submit' name='updateProject' value='Update'/>
                                <input type='submit' name='deleteProject' value='Delete'/>
                            </td>
                        </tr></form>\n";
                    }
                }else{
                    $html .= "<tr><th>Project Name</th><th>Project Lead</th><th>Email</th><th>Project Description</th></tr>";
                    foreach($data as $project){
                        $html .= "<tr>
                            <td>{$project->getProjectName()}</td>
                            <td>{$project->getProjectLead()}</td>
                            <td><a href='mailto:{$project->getEmail()}'>{$project->getEmail()}</a></td>
                            <td>{$project->getDescription()}</td>
        
                        </tr>";
                    }
                }
                $html .= "</table>";
            }else{
                $html = "<h2 class='errorMsg'>No projects exist.</h2>";
            }
            return $html;
        }

        function displayInsertForm(){
            $html = "
                <h3 id='addnew'>Add A New Project</h3>
                <table>
                <form action ='myProjects.php' method='post'>
                    <tr>
                    <td><input type='text' name='new_project_name' placeholder='Project Name'/></td>
                    <td><input type='text' name='new_project_lead' placeholder='Project Lead'/></td>
                    <td><input type='text' name='new_project_desc' placeholder='Project Description'/></td>
                    <td>
                        <input type='submit' name='insertProject' value='Insert'/>
                    </td>
                </tr>
                </form>
            </table>";
            return $html;
        }
	    
	function searchProjects($name){
		if(!empty($name)){
            try{
			     $name = "%".$name."%";
                	$data = array();
               		$stmt = $this->dbConn->prepare("SELECT DISTINCT projectName, projectDescription, name AS 'projectLead', email AS 'email' FROM project JOIN user ON project.projectLead = user.id WHERE user.role =  1 AND projectName LIKE :name"); 
                	$stmt->bindParam(":name", $name, PDO::PARAM_STR, 150);    
                	$stmt->execute();
                	$stmt->setFetchMode(PDO::FETCH_CLASS,"Project");
                	while($databaseProjects = $stmt->fetch()){
                    		$data[] = $databaseProjects;
                	}
                	return $data;
            }
            catch(PDOException $e){
                echo $e->getMessage();
                throw new Exception("Problem searching for projects in the database.");
            }
        }
        else{
            echo "test";
            header("Refresh:0");
        }
	}
}  
?>
