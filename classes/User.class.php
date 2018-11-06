<?php 
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
		
		public function getId(){
			return $this->id;
		}
		
		public function getUsername(){
			return $this->username;
		}
		
		public function getPassword(){
			return $this->password;
		}
		
		public function getName(){
			return $this->name;
		}
		
		public function getTagline(){
			return $this->tagline;
		}
		
		public function getImagePath(){
			return $this->imagePath;
		}
		
		public function getTitle(){
			return $this->title;
		}
		
		public function getInterestArea(){
			return $this->interestArea;
		}
		
		public function getOffice(){
			return $this->office;
		}
		
		public function getWebsite(){
			return $this->website;
		}
		
		public function getPhone(){
			return $this->phone;
		}
		
		public function getEmail(){
			return $this->email;
		}
		
		public function getRole(){
			return $this->role;
		}
	}
?>