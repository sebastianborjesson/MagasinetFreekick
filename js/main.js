$(function(){

	$(".pageForm").submit(function() {
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
          saveMenu();
          console.log("upload success: ", data);
          // $(this).reset();
        },
        error: function(data) {
          console.log("upload error: ", data);
        }
      });
      //return false to prevent page reload on form submit
      return false;
	});

	function saveMenu () {
		var urlValue = {
			":path" : $("#inputPageUrl").val()
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
				console.log("saveMenu success: ", data);
				saveNewMenuLink();
				// $(this).reset();
			},
			error: function(data) {
				console.log("saveMenu error: ", data.responseText);
			}
		});
		return false;
	}

	function saveNewMenuLink() {
		var newMenuLink = {
			":menu_link_title" : $("#inputMenuName").val()
		};
			console.log("newMenuLink: ", newMenuLink);
		$.ajax({
			url: "php/save_content.php",
			dataType: "json",
			data: {
				"menu_link" : newMenuLink
			},
			success: function(data) {
					console.log("menu_name success: ", data);
					// $(this).reset();
			},
				error: function(data) {
					console.log("menu_name error: ", data.responseText);
			}
		});
		return false;
	}



});