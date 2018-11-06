<?php
    /*
    * DB class contains all of the methods for creating a connection to,
    * making an object for, and interacting with the Database.
	* version 11/6/2018
	*/
    class DB{
        private $dbh;

        /**
         * __construct() - creates a new PDO database object, opening a connection at the same time
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
         * updateField() - updates an item for any field for any table
         */
        function updateField($tableName, $fieldName, $value, $id){
            
        }

        /**
         * delete() - deletes any entry for any table
         */
        function delete($tableName, $id){

        }

        /**
         * getFieldById() - Returns a specific entry from any table 
         */
        function getFieldById($tableName, $fieldName, $id){

        }

        /**
         * getEverythingAsObjects() - returns everything in the given table as objects of the given class
         */
        function getEverythingAsObjects($tableName, $className){
            
        }
    } // class
?>