$("#inputPageTitle").val();
		$("#inputPageBody").val();
		$("#inputPageUrl").val();
		$("#inputMenuName").val();

		SELECT pages.pid, pages.title, pages.body, url_alias.path, menu_links.title, menu_links.mlid, menu_links.plid FROM pages, url_alias, menu_links WHERE pages.pid = url_alias.pid AND url_alias.path = menu_links.path AND pages.pid = 2