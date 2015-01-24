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
		var menuValue = $("#inputMenuName").val();
		console.log("menu value: ", data);
		$.ajax({
			url: "php/save_content.php",
			dataType: "json",
			data: {
			// giv other name
			"menu_data" : menuValue
		},
		success: function(data) {
			console.log("saveMachineNameUrlAlias success: ", data);
			
			// $(this).reset();
		},
		error: function(data) {
			console.log("saveMachineNameUrlAlias error: ", data);
		}
	});
		return false;
	}

	function saveNewMenuLink() {
		$.ajax({
			url: "php/save_content.php",
			dataType: "json",
			data: {
				"menu_link" : uploadMenuLink
			},
			success: function(data) {
				console.log("menu_name in success: ", uploadMenuLink);
				console.log("menu_name success: ", data);
        // $(this).reset();
        },
			error: function(data) {
				console.log("menu_name error: ", data);
		}
	});
		return false;
	}



});