<?php
    /*
    * DB class contains all generalized methods for creating a connection to,
    * retrieving from, updating, deleting from, and inserting into the database.
	* version 11/8/2018
	*/
    
    class DB{
        private $dbConn;
        /**
         * __construct() - creates a new PDO database object and opens a connection.
         */
        function __construct(){
            try{
                // open a connection
                $this->dbConn = new PDO("mysql:host={$_SERVER['DB_SERVER']};dbname={$_SERVER['DB']}",
                    $_SERVER['DB_USER'],$_SERVER['DB_PASSWORD']);

                // Change the error reporting for development
                $this->dbConn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);

            }
            catch(PDOException $e){
                echo $e;
                throw new Exception("Problem Connecting to Server \n" . $e);
            }
        } // construct

        /**
         * getConn() - Returns the connection object for easy access
         */
        function getConn(){
            return $this->dbConn;
        }

        /**
         * logout() - unset and destroys a session, effectively logging a user
         */
        function logOut()
        {
            session_unset();

            unset($_COOKIE[session_name()]);
            setcookie(session_name(), "", time() - 3600, "/");

            session_destroy();   
            
            header("Location: ./index.php");
            exit; 
        }

        /**
         * updateField() - updates a column for any field for any table
         */
        function updateField($tableName, $fieldName, $value, $id){
		echo "$tableName, $fieldName, $value, $id in the updateField function";
            try{
                $query = "UPDATE $tableName SET $fieldName = :value WHERE id = :id";
                $stmt = $this->dbConn->prepare($query);
                $stmt->execute(array(
                    ":value"=>$value,
                    ":id"=>$id
                ));
            }catch(PDOException $e){
                return "<h2>A problem occurred updating $tableName</h2>";
            }
        }

        /**
         * delete() - deletes any entry for any table
         */
        function delete($tableName, $id){
		var_dump($id);
		var_dump($tableName);
            try{
                $query = "DELETE FROM $tableName WHERE id = :id";
                $stmt = $this->dbConn->prepare($query);
                $stmt->execute(array(
                    ":id"=>$id
                ));
            }catch(PDOException $e){
                return "A problem occurred deleting from $tableName";
            }
        }

        /**
         * getFieldById() - Returns a specific entry from any table 
         */
        function getFieldById($tableName, $fieldName, $id){
            $data = array();
            try{
                $query = "SELECT :fieldName FROM :table WHERE id = :id";
                $stmt = $this->dbConn->prepare($query);
                $stmt->setFetchMode(PDO::FETCH_ASSOC);
                $stmt->bindParam(array(
                    ":table"=>$tableName,
                    ":column"=>$fieldName,
                    ":id"=>$id
                ));
                $stmt->execute();
                while($item = $stmt->fetch()){
                    $data[] = $item;
                }
            }catch(PDOException $e){
                return "A problem occurred selecting the $fieldName from the table $tableName";
            }
            return $data;
        }

        /**
         * getEverythingAsObjects() - returns everything in the given table as objects of the given class
         */
        function getEverythingAsObjects($tableName, $className){
            include_once("$className.class.php");
            $data = array();
            try{
                //$query = "SELECT * FROM $tableName";
                $query = "SELECT projectName, name as 'projectLead', email, projectDescription  FROM $tableName p JOIN user u WHERE p.projectLead = u.id";
                $stmt = $this->dbConn->prepare($query);
                $stmt->execute();
                $stmt->setFetchMode(PDO::FETCH_CLASS, $className);
                while($item = $stmt->fetch()){
                    $data[] = $item;
                }
            }catch(PDOException $e){
                return "A problem occurred getting everything from the table $tableName";
            }
            return $data;
        }

        function getObjectByID($table, $className, $id){
            $object = null;
            $query = "SELECT * FROM $table WHERE id = :id";
            $stmt = $this->dbConn->prepare($query);
            $stmt->bindParam(":id", $id);
            $stmt->execute();
            $stmt->setFetchMode(PDO::FETCH_CLASS, $className);
            $object = $stmt->fetch();

            return $object;
        }

	function sanitize($value){
		$value = trim($value);
		$value = stripslashes($value);
		$value = strip_tags($value);
		$value = htmlentities($value);
		return $value;
	}

	function isAlphabetic($value){
		$reg = "/^[a-zA-Z] [a-zA-Z ]+$/";
		return preg_match($reg, $value);
	}

	function isAlphaNumeric($value){
		$reg = "/^[a-zA-Z0-9 ]+$/";
		return preg_match($reg, $value);
	}

	function isNumeric($value){
		$reg = "/^[0-9]*$/";
		return preg_match($reg, $value);
    }
    
    function isValidEmail($value){
        //$reg = "/^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/";
        $reg = "/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/";//dale's version, remove at will
        return preg_match($reg, $value);
    }

    function isValidWebsite($value){
        $reg = "/^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/";
        return preg_match($reg, $value);
    }

    function isValidPhone($value){
        $reg = "/^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$/";
        return preg_match($reg, $value);
    }

    } // class
?>
