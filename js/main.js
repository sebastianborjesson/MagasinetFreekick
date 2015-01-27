$(function(){

	$(".pageForm").submit(function() {
    var uploadPage = {
      ":title" : $("#inputPageTitle").val(),
      ":body" : $("#inputPageBody").val(),
      ":path" : $("#inputPageUrl").val(),
      ":menu_link_title" : $("#inputMenuName").val(),
      ":menu_link_path" : $("#inputPageUrl").val(),
    };
    console.log("uploadPage: ", uploadPage);
      $.ajax({
        url: "php/save_content.php",
        dataType: "json",
        data: {
          "page_info" : uploadPage
        },
        success: function(data) {
          
          console.log("upload success: ", data);
          // $(this).reset();
        },
        error: function(data) {
          console.log("upload error: ", data.responseText);
        }
      });
      //return false to prevent page reload on form submit
      return false;
	});

	



});