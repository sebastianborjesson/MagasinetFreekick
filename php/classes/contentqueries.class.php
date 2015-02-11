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
		$sql = "SELECT pages.pid, pages.title AS pageTitle, pages.body, url_alias.path, menu_links.title
		FROM pages, url_alias, menu_links 
		WHERE pages.pid = url_alias.pid AND url_alias.path = menu_links.path";
		return $this->query($sql);
	}

	public function updatePage($update_data) {

		$sql = "UPDATE pages, url_alias, menu_links 
		SET pages.pid=:pid, pages.title=:title, pages.body=:body, url_alias.path=:path, menu_links.title=:menu_link_title, menu_links.path=:path
		WHERE pages.pid=:pid AND url_alias.pid=pages.pid AND menu_links.path=url_alias.path";
		return $this->query($sql, $update_data);
	}

	/*
	UPDATE pages, url_alias, menu_links 
	SET pages.title=:title, pages.body=:body, url_alias.path=:path, menu_links.path =:menu_link_path, menu_links.title=:menu_link_title
	WHERE pages.pid=:pid AND url_alias.pid=pages.pid AND url_alias.path=menu_links.path AND menu_links.title='fnoiasnlfk'

	$update_data = array (
	":title" => 'brewve',
	":body" => 'btergwe',
	":path" => 'tnehrgw',
	":menu_link_path" => 'tnehrgw',
	":menu_link_title" => 'thergwe',
	":pid" => 113
	);


	*/
	

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