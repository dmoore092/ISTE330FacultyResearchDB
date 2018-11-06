<?php 
	/*
	* User class contains all of the methods and variables for
	* interacting with a User object
	* version 11/6/2018
	*/
	class User{
		private $id;
		private $username;
		private $password;
		private $name;
		private $tagline;
		private $imagePath;
		private $title;
		private $interestArea;
		private $office;
		private $website;
		private $phone;
		private $email;
		private $role;
		
		/**
		 * getId() - returns the User's ID
		 */
		public function getId(){
			return $this->id;
		}
		
		/**
		 * getUsername() - returns the User's username
		 */
		public function getUsername(){
			return $this->username;
		}
		
		/**
		 * getPassword() - returns the User's hashed password from the DB
		 */
		public function getPassword(){
			return $this->password;
		}
		
		/**
		 * getName() - returns the User's Name
		 */
		public function getName(){
			return $this->name;
		}
		
		/**
		 * getTagLine() - returns the User's Tag Line
		 */
		public function getTagline(){
			return $this->tagline;
		}
		
		/**
		 * getImagePath() - returns the User's Image Path
		 */
		public function getImagePath(){
			return $this->imagePath;
		}
		
		/**
		 * getTitle() - returns the User's Title
		 */
		public function getTitle(){
			return $this->title;
		}
		
		/**
		 * getInterestArea() - returns the User's Interest Area
		 */
		public function getInterestArea(){
			return $this->interestArea;
		}
		
		/**
		 * getOffice() - returns the User's Office
		 */
		public function getOffice(){
			return $this->office;
		}
		
		/**
		 * getWebsite() - returns the User's Website
		 */
		public function getWebsite(){
			return $this->website;
		}
		
		/**
		 * getPhone() - returns the User's Phone
		 */
		public function getPhone(){
			return $this->phone;
		}
		
		/**
		 * getEmail() - returns the User's Email
		 */
		public function getEmail(){
			return $this->email;
		}
		
		/**
		 * getRole() - returns the User's Role
		 */
		public function getRole(){
			return $this->role;
		}
	}
?>