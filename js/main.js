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
			checkBeforeInsert();
		}
		return false;
	});

	function checkBeforeInsert() {
    var urlValue = {
      ":path" : endUrl
    };

    $.ajax({
      url:"php/getcontent.php",
      dataType: "json",
      data: {
        checkAlias: urlValue
      },
      success: function(data) {
        console.log("checkAlias: ", data);
        if (!data) {
          insertPage();
        } else {
          $(".pageForm .alert").remove();
          $(".pageForm").prepend('<div class="alert alert-warning alert-dismissible" role="alert">' +
            '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' +
            '<strong>Notice:</strong> This page title is already taken! Please choose another one :)'+
          '</div>');
          window.scrollTo(100, 0);
        }
      }
    });
	}

	function insertPage() {
    var uploadPage = {
      ":title" : $("#inputPageTitle").val(),
      ":body" : $("#inputPageBody").val(),
      ":img_id" : $(".imgSelect select").val()
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
			":menu_link_title" : endUrl,
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
          if (data) {
            $(".pageForm").prepend('<div class="alert alert-success" role="alert">' +
            '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' +
            '<strong>Success:</strong> You successfully inserted a new page! :)'+
            '</div>');
            window.scrollTo(100, 0);
          }
          $(".pageForm")[0].reset();
			},
				error: function(data) {
					console.log("saveNewMenuLink error: ", data.responseText);
			}
		});
		return false;
	}

	
getImages();
getFooter();


});
// hämta footer-information
function getFooter () {
  $.ajax ({
    url: "php/get_footer.php",
    dataType: "json",
    success: function(data) {
      console.log("getFooter success: ", data);
      for (var i = 0; i < data.length; i++) {
        var footerData = $("<p class='footContent'/>");

        footerData.append("<p><strong>Contact info:</strong></p>");
        footerData.append("<p>Name: "+data[i].name+"</p>");
        footerData.append("<p>Email: "+data[i].email+"</p>");
        footerData.append("<p>Phone number: "+data[i].phone+"</p>");
        footerData.append("<p>Street: "+data[i].street+"</p>");
        footerData.append("<p>Postalcode: "+data[i].postalcode+"</p>");
        footerData.append("<p>City: "+data[i].city+"</p>");

        $("footer .footerData").append(footerData);
      }
    },
    error: function(data) {
      console.log("getFooter error: ", data.responseText);
    }
  });
  return false;
}

// hämta bild-information
function getImages () {
  $.ajax({
    url: "php/get_images.php",
    dataType: "json",
    success: function(data) {
      console.log("getImages success: ", data);
      createImagesSelect(data);

    },
    error: function(data) {
      console.log("getImages error: ", data.responseText);
    }
  });
  return false;
}

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


