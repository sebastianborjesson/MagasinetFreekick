<?php

class ContentQueries extends PDOHelper {

  //later when we have login in place, real user_info 
  //will be stored in the property user_info.
  //for now let's just fake it
  protected $user_info = array("user_id" => 1);

	public function storeNewPage ($page_data) {
		
		//adding user_id before insert
    	$page_data[":user_id"] = $this->user_info["user_id"];

		$sql = "INSERT INTO pages (title, body, user_id) VALUES (:title, :body, :user_id)";
		return $this->query($sql, $page_data);
	}


	public function addMenuLink ($menu_data) {
		$menu_link[":menu_link_menu"] = $this->menu_name;
		$sql = "INSERT INTO menu_links (title, path, menu, plid, weight) VALUES (:title, :path, :menu_name, :plid, :weight)";
		$this->query($sql, $menu_data);

	}

	public function getMenuNames() {
	    $sql = "SELECT * FROM menus";
	    return $this->query($sql);
	  }


  public function getMenuLinks($menu_link) {
	    $menu_link = array(":menu_name" => $menu_link);
	    $sql = "SELECT * FROM menu_links WHERE menu = :menu_name";
	    
	    return $this->query($sql, $menu_name);
	  }



	public function getAllPages() {
		$sql = "SELECT * FROM pages";
		return $this->query($sql);
	}

	public function searchForPages($search_param) {
		$search_param = array(":search_param" => "%".$search_param."%");
		$sql = "SELECT * FROM pages WHERE title LIKE :search_param";
		return $this->query($sql, $search_param);

	}

	public function saveNewMenuName ($menu_name) {
		$path = array(":menu_data" => $menu_name);
		$sql = "INSERT INTO menu_links (title) VALUES ($path)";
	    return $this->query($sql, $menu_name);
	}

}