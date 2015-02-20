<?php

class ContentQueries extends PDOHelper {

  //later when we have login in place, real user_info 
  //will be stored in the property user_info.
  //for now let's just fake it
  protected $user_info = array("user_id" => 1);


  public function getPages($url_info) {
  	$sql = "SELECT pid from url_alias WHERE path = :path";
  	$url_paths = array(":path" => $url_info);
  	$url_path_info = $this->query($sql, $url_paths);

  	$sql2 = "SELECT * FROM pages WHERE pid = :pid";
  	$page_info = array(":pid" => $url_path_info[0]["pid"]);

  	$result = $this->query($sql2, $page_info);

  	if ($result[0]["img_id"] !== null) {
  		$sql3 = "SELECT * FROM images WHERE iid = :img_id";
  		$result[0]["imgData"] = $this->query($sql3, array(":img_id" => $result[0]["img_id"]));
  	}

  	return $result;
  }

  public function getImages() {
  	$sql = "SELECT * FROM images";

  	return $this->query($sql);
  }

	public function getMenuLinks() {
   
    $sql = "SELECT * FROM menu_links";
    
    return $this->query($sql);
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

		if ($menu_datas[":menu_link_plid"] == "Top") {
			$menu_datas[":menu_link_plid"] = NULL;
		}
				
		$menu_link[":menu_link_menu"] = "my-menu-machine-name";
		$sql = "INSERT INTO menu_links (title, path, menu, plid, weight) 
		VALUES (:menu_link_title, :menu_link_path, :menu_link_menu, :menu_link_plid, :menu_link_weight)";

		 $menu_data = array(
		 	":menu_link_title" => $menu_datas,
		 	":menu_link_path" => $url_path,
			":menu_link_menu" => $menu_link,
			":menu_link_plid" => $menu_datas,
			":menu_link_weight" => $menu_datas

			
		 	);

		return $this->query($sql, $menu_datas);

	}

	public function checkAlias($alias) {
		$sql = "SELECT * FROM url_alias WHERE path = :path;";
		return $this->query($sql, $alias) ? true : false;
	}

}