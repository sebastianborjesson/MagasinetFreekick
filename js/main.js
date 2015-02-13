$(function(){

	function updatePage(page_id) {
		var updatePageValues = {
			":title" : $("#inputPageTitle").val(),
			":body" : $("#inputPageBody").val(),
			":path" : $("#inputPageUrl").val(),
			":menu_link_title" : $("#inputMenuName").val(),
			":menu_link_path" : $("inputPageUrl").val(),
			":pid" : page_id
		};
		$.ajax({
			url:"php/save_content.php",
			dataType:"json",
			data: {
				"update_page" : updatePageValues
			},
			success: function(data) {
				console.log("updatePageValues success: ", data);
			},
			error: function(data) {
				console.log("updatePageValues error: ", data.responseText);
			}
		});
		return false;
	}

	$(".pageForm").submit(function() {
		console.log("form pageData: ", $(this).data("pageData"));
		if ($(this).data("pageData")) {
			updatePage($(this).data("pageData").pid);
		}
		else {
			insertPage();
		}
		return false;
	});

	function insertPage() {
    var uploadPage = {
      ":title" : $("#inputPageTitle").val(),
      ":body" : $("#inputPageBody").val(),
    };
    console.log("uploadPage: ", uploadPage);
      $.ajax({
        url: "php/save_content.php",
        dataType: "json",
        data: {
          "page_info" : uploadPage
        },
        success: function(data) {
          saveUrlAlias();
          console.log("upload success: ", data);
         
        },
        error: function(data) {
          console.log("upload error: ", data.responseText);
        }
      });
      //return false to prevent page reload on form submit
      return false;
	}

	function saveUrlAlias () {
		var urlValue = {
			":path" : $("#inputPageUrl").val(),
		};
		console.log("urlValue: ", urlValue);
		$.ajax({
			url: "php/save_content.php",
			dataType: "json",
			data: {
			// giv other name
			"menu_data" : urlValue
			},
			success: function(data) {
				console.log("saveUrlAlias success: ", data);
				saveNewMenuLink();
				
			},
			error: function(data) {
				console.log("saveUrlAlias error: ", data.responseText);
			}
		});
		return false;
	}

	function saveNewMenuLink() {
		var newMenuLink = {
			":menu_link_title" : $("#inputMenuName").val(),
			":menu_link_path" : $("#inputPageUrl").val(),
			":menu_link_menu" : "my-menu-machine-name",
			":menu_link_plid" : $("select option:selected").val(),
			":menu_link_weight" : $("#menu_weight").val()

		};
			console.log("newMenuLink: ", newMenuLink);
		$.ajax({
			url: "php/save_content.php",
			dataType: "json",
			data: {
				"menu_link" : newMenuLink
			},
			success: function(data) {
					console.log("saveNewMenuLink success: ", data);
					
			},
				error: function(data) {
					console.log("saveNewMenuLink error: ", data.responseText);
			}
		});
		return false;
	}




	function getAllMenuLinks (get_menu_links) {
		$.ajax({
			url: "php/get_menu_content.php",
			dataType: "json",
			// data: {
			// "get_menu_links" : get_menu_links
			// },
			success: function(data) {
				console.log("getAllMenuLinks success: ", data);
				createAdminSelect (data);


			},
			error: function(data) {
				console.log("getAllMenuLinks error: ", data.responseText);
			}
		});
		return false;
	}
	

getAllMenuLinks ();

});