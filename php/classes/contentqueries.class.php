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

		$menu_data = $page_data["menuData"];
    	unset($page_data["menuData"]);
	    $url_path = $url_data[":path"];
	    unset($url_data[":path"]);

		$sql = "INSERT INTO pages (title, body, user_id) VALUES (:title, :body, :user_id)";
		var_dump($page_data);
		// save new page
		$this->query($sql, $page_data);
		$menu_data[":menu_link_path"] = $this->saveNewUrlAlias($url_data);
		$this->addMenuLink($menu_data);

	}

	public function saveNewUrlAlias($url_data) {
		$sql = "SELECT pid FROM pages ORDER BY created DESC LIMIT 1";
    	$new_pid = $this->query($sql);

    	$new_pid = $new_pid[0]["pid"];
		
		

	    $sql2 = "INSERT INTO url_alias (path, pid) VALUES (:path, :pid)";
	    $url_info = array(":path" => $url_path, ":pid" => $new_pid);
    	
	    var_dump($url_info);
	    return $this->query($sql2, $url_info);
	}

	public function addMenuLink($menu_data) {

		$menu_link[":menu_link_menu"] = "my-menu-machine-name";
		$sql = "INSERT INTO menu_links (title, path, menu) VALUES (:menu_link_title, :menu_link_path, :menu_link_menu)";

		$menu_data = array(
			":menu_link_title" => $menu_data,
			":menu_link_path" => $url_path,
			":menu_link_menu" => $menu_link,
			
			);

		var_dump($menu_data);
		return $this->query($sql, $menu_data);

	}

}