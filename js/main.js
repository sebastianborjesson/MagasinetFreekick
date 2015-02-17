$(function(){

	function updatePage(page_id) {
		var updatePageValues = {
			":title" : $("#inputPageTitle").val(),
			":body" : $("#inputPageBody").val(),
			":path" : endUrl,
			":menu_link_title" : $("#inputMenuName").val(),
			":menu_link_path" : endUrl,
			":pid" : page_id
		};
		$.ajax({
			url:"php/save_content.php",
			dataType:"json",
			data: {
				"update_page" : updatePageValues
			},
			success: function(data) {
				

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
			console.log("insertPage success: ", data);
			saveUrlAlias();
          
         
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
			":path" : endUrl
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
			":menu_link_path" : endUrl,
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
					console.log("Inserted new page: ", data);
					
			},
				error: function(data) {
					console.log("saveNewMenuLink error: ", data.responseText);
			}
		});
		return false;
	}

	



});

// hämta alla länkarna utanför en DOM-ready
function getAllMenuLinks (activePath) {
	$.ajax({
		url: "php/get_menu_content.php",
		dataType: "json",
		success: function(data) {
			console.log("getAllMenuLinks success: ", data);
			createAdminSelect (data);
			createMenu(data);
			$('a[href="'+activePath+'"]').parent("li").addClass('active');

		},
		error: function(data) {
			console.log("getAllMenuLinks error: ", data.responseText);
		}
	});
	return false;
}