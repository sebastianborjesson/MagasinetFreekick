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

	public function updatePage() {
		$sql = "UPDATE pages, url_alias, menu_links SET ";
	}

	public function getAllPages() {
		$sql = "SELECT pages.pid, pages.title, pages.body, pages.created, CONCAT(users.fname, ' ', users.lname) as author FROM pages, users";
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

		$sql = "INSERT INTO pages (title, body, user_id) VALUES (:title, :body, :user_id)";
		
		// save new page
		return $this->query($sql, $page_data);
		$menu_data[":menu_link_path"] = $this->saveNewUrlAlias($url_path);
		$this->addMenuLink($menu_data);

	}

	public function saveNewUrlAlias($url_data) {

		$sql = "SELECT pid FROM pages ORDER BY created DESC LIMIT 1";
    	$new_pid = $this->query($sql);

    	$new_pid = $new_pid[0]["pid"];
		
	    $url_path = $url_data[":path"];
	    unset($url_data[":path"]);
		

	    $sql2 = "INSERT INTO url_alias (path, pid) VALUES (:path, :pid)";
	    $url_data = array(":path" => $url_path, ":pid" => $new_pid);
    	
	    
	    return $this->query($sql2, $url_data);
	}

	public function addMenuLink($menu_datas) {
		
		
		$menu_link[":menu_link_menu"] = "my-menu-machine-name";
		$sql = "INSERT INTO menu_links (title, path, menu) VALUES (:menu_link_title, :menu_link_path, :menu_link_menu)";

		 $menu_data = array(
		 	":menu_link_title" => $menu_datas,
		 	":menu_link_path" => $url_path,
			":menu_link_menu" => $menu_link
			
		 	);

		return $this->query($sql, $menu_datas);

	}

}