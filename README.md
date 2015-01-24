$sql = "SELECT pid FROM pages ORDER BY created DESC LIMIT 1";
    	$new_pid = $this->query($sql);

    	$new_pid = $new_pid[0]["pid"];

	    $url_path = $menu_name[":path"];

	    $sql2 = "INSERT INTO url_alias (path, pid) VALUES (:path, :pid)";
	    $menu_info = array(":path" => $page_path, ":pid" => $new_pid);
	    
	    return $this->query($sql, $menu_name);