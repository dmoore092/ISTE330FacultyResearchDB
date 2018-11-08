<?php
    /*
    * DB class contains all generalized methods for creating a connection to,
    * retrieving from, updating, deleting from, and inserting into the database.
	* version 11/8/2018
	*/
    class DB{
        private $dbh;

        /**
         * __construct() - creates a new PDO database object and opens a connection.
         */
        function __construct(){
            try{
                // open a connection
                $this->dbh = new PDO("mysql:host={$_SERVER['DB_SERVER']};dbname={$_SERVER['DB']}",
                    $_SERVER['DB_USER'],$_SERVER['DB_PASSWORD']);

                // Change the error reporting for development
                $this->dbh->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);

            }
            catch(PDOException $e){
                throw new Exception("Problem Connecting to Server \n" . $e);
            }
        } // construct

        /**
         * getConn() - Returns the connection object for easy access
         */
        function getConn(){
            return $this->dbh;
        }

        /**
         * updateField() - updates a column for any field for any table
         */
        function updateField($tableName, $fieldName, $value, $id){
            $ra = -1;
            try{
                $query = "UPDATE :table SET :column = :value WHERE id = :id";
                $stmt = $this->dbh->prepare($query);
                $stmt->bindParam(array(
                    ":table"=>$tableName,
                    ":column"=>$fieldName,
                    ":value"=>$value,
                    ":id"=>$id
                ));
                $ra = $stmt->execute();
            }catch(PDOException $e){
                return "A problem occurred updating $tableName";
            }
            return $ra;
        }

        /**
         * delete() - deletes any entry for any table
         */
        function delete($tableName, $id){
            $ra = -1;
            try{
                $query = "DELETE FROM :tableName WHERE id = :id";
                $stmt = $this->dbh->prepare($query);
                $stmt->bindParam(array(
                    ":table"=>$tableName,
                    ":id"=>$id
                ));
                $ra = $stmt->execute();
            }catch(PDOException $e){
                return "A problem occurred deleting from $tableName";
            }
            return $ra;
        }

        /**
         * getFieldById() - Returns a specific entry from any table 
         */
        function getFieldById($tableName, $fieldName, $id){
            $data = array();
            try{
                $query = "SELECT :fieldName FROM :table WHERE id = :id";
                $stmt = $this->dbh->prepare($query);
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
            
        }
    } // class
?>