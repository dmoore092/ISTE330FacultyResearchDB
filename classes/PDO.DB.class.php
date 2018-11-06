<?php
    class DB{
        private $dbh;
        function __construct(){
            try{
                // open a connection
                $this->dbh = new PDO("mysql:host={$_SERVER['DB_SERVER']};dbname={$_SERVER['DB']}",
                    $_SERVER['DB_USER'],$_SERVER['DB_PASSWORD']);

                // Change the error reporting for development
                $this->dbh->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);

            }
            catch(PDOException $e){
                die("Problem Connecting to Server");
            }
        } // construct
    } // class
?>