<?php 
    require_once "PDO.DB.class.php";

	include("User.class.php");

	/*
	* UserDB class contains all of the methods for using PHP Data Objects to 
	* interface with the database, specifically in relation to users.
	* version 11/6/2018
	*/
    class UserDB extends DB{
        private $dbConn;
		/*
		* Constructor for UserDB calls the parent constructor and obtains the connection
		* using the connection accessor method. This will allow us to use methods in the parent class.
		*/
        function __construct(){
            parent::__construct();
            $this->dbConn = $this->getConn();
		}
		
		/**
		 * getUsersByRole() - returns an array of users from the database whose role matches that of the specified role
		 */
		function getUsersByRole($role){
			try{
                $data = array();
                $stmt = $this->dbConn->prepare("select * from user where role = :role"); 
                $stmt->bindParam("role",$role,PDO::PARAM_INT);    
                $stmt->execute();
                $stmt->setFetchMode(PDO::FETCH_CLASS,"User");
                while($databaseUser = $stmt->fetch()){
                    $data[] = $databaseUser;
                }
                return $data;
            }
            catch(PDOException $e){
                echo $e->getMessage();
                throw new Exception("Problem getting Project from database.");
            }
		}

		/**
		 * updateUser() - Takes in an associative array where the key is the field name and the value is the value to be updated for that field, then updates them
		 */
		function updateUser($updateArray){
			$id = '';
            foreach($updateArray as $key=>$val){
                switch($key){
                    case "user_username": // case will be the name of the form field the user types in
                        $id = $val;
                        break;
                    case 'user_password':
                        $this->updateField('user', 'password', $val, $id);
                        break;
                    case 'user_name':
                        $this->updateField('user', 'name', $val, $id);
                        break;
                    case 'user_tagline':
                        $this->updateField('user', 'tagline', $val, $id);
						break;
					case 'user_imagepath':
                        $this->updateField('user', 'imagepath', $val, $id);
                        break;
                    case 'user_title':
                        $this->updateField('user', 'title', $val, $id);
                        break;
                    case 'user_interestArea':
                        $this->updateField('user', 'interestArea', $val, $id);
						break;		
					case 'user_office':
                        $this->updateField('user', 'office', $val, $id);
                        break;
                    case 'user_website':
                        $this->updateField('user', 'website', $val, $id);
                        break;
                    case 'user_phone':
                        $this->updateField('user', 'phone', $val, $id);
						break;
					case 'user_email':
						$this->updateField('user', 'email', $val, $id);
						break;
					case 'user_role':
						$this->updateField('user', 'role', $val, $id);
						break;
                }
            }
		}

		/**
		 * login() - Takes in a possible username and password for a given user, checks them against the databas, returns a boolean if the user and password match 
		 * and false if they don't
		 */
		function login($username, $password){
				$hashed_password = hash('sha256', $password);
				$stmt = $this->dbConn->prepare("select username, password, role from user where username = ?"); 
				$stmt->bindParam(1, $username, PDO::PARAM_STR);
				$stmt->execute();
				$stmt->setFetchMode(PDO::FETCH_CLASS,"User");
                while($databaseUser = $stmt->fetch()){
                    $data[] = $databaseUser;
				}
				if((count($data)) == 1){
					var_dump($data);
					$user = $data[0];
					var_dump($hashed_password);
					if(password_verify($user->getPassword(), $hashed_password)) {
						$_SESSION['username'] = $user->getUsername();
						$_SESSION['role'] = $user->getRole();
						$_SESSION['loggedIn'] = true;
					}
				}
		}
	} // class
?>