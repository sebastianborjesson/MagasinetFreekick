<?php

class ContentQueries extends PDOHelper {

  //later when we have login in place, real user_info 
  //will be stored in the property user_info.
  //for now let's just fake it
  protected $user_info = array("user_id" => 1);




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

	public function storeNewPage ($page_data) {
		
		//adding user_id before insert
    	$page_data[":user_id"] = $this->user_info["user_id"];

		$sql = "INSERT INTO pages (title, body, user_id) VALUES (:title, :body, :user_id)";
		return $this->query($sql, $page_data);
	}

	public function saveNewMenuName($menu_name) {
		$sql = "SELECT pid FROM pages ORDER BY created DESC LIMIT 1";
    	$new_pid = $this->query($sql);

    	$new_pid = $new_pid[0]["pid"];
		
	    $url_path = $menu_name[":path"];
	    unset($menu_name[":path"]);

	    $sql2 = "INSERT INTO url_alias (path, pid) VALUES (:path, :pid)";
	    $menu_info = array(":path" => $url_path, ":pid" => $new_pid);
    	
	    
	    return $this->query($sql2, $menu_info);
	}

	public function addMenuLink($menu_link) {
		
		$menu_link[":menu_link_menu"] = $this->menu_name;
		$sql = "INSERT INTO menu_links (title, path, menu) VALUES (:menu_link_title, :menu_link_path, :menu_link_menu)";
		var_dump($menu_link);
		return $this->query($sql, $menu_link);

	}

}