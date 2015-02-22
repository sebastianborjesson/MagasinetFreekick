$(function(){

	$(".sign-in a.btn").click(function(){
		$(".pageForm").data("pageData", null);
		$(".pageForm").show();
		$(".content-list").hide();
	});

	$(".sign-in .update").click(function(){

		$(".pageForm").hide();
		$(".content-list").show();
		getPages();

	});

	function getPages() {
		$.ajax({
			url: "php/getcontent.php",
			dataType: "json",
			data: {
				"get_pages" : 1
			},
			success: function(data) {
					console.log("getPages success: ", data);

					$(".content-list table tr").not(".pageTable").remove();

					for (var i = 0; i < data.length; i++) {
						var tableData = $("<tr/>");
							tableData.data("page", data[i]);
							
							tableData.append('<td><span class="badge">'+data[i].pid+"</span></td>");
							tableData.append('<td>'+data[i].pageTitle+"</td>");
							tableData.append('<td>'+data[i].path+"</td>");
							tableData.append('<td>'+data[i].body+"</td>");
							tableData.append('<td>'+data[i].title+"</td>");
							tableData.append('<td><button class="edit glyphicon glyphicon-pencil btn btn-xs"></button></td>');


							//when edit is clicked
							//find data using
							// $(this).parents("tr").data("page");
							//console.log(tableData.data("page"));
						$(".content-list table").append(tableData);
					}
					
			},
				error: function(data) {
					console.log("getPages error: ", data.responseText);
			}
		});
		return false;
	}

	$(document).on("click",".edit", function() {

		$('.content-list').hide();
		$('.pageForm').show();
		$(this).parents("tr").data("page");
		console.log($(this).parents("tr").data("page"));
		editPage($(this).parents("tr").data("page"));

	});

	function editPage(pageData) {
		$(".pageForm").data("pageData", pageData);
		$("#inputPageTitle").val(pageData.pageTitle);
		$("#inputPageBody").val(pageData.body);
		$("#inputPageUrl").val(pageData.path);
		$("#inputMenuName").val(pageData.title);

	}

	$('.carousel').carousel({
		interval: 4000,
		pause: "hover"

	});

	$("header li").click(function() {

		$("header li").addClass('active').not(this).removeClass('active');
		

	});


	$(".carousel .btn").click(function() {

		var currentHref = $(this).attr("href");
		$('main').children().hide();
		$('.'+currentHref).show();

	});



	$("#inputMenuName").keyup(function() {
		var machineUrl = $("#inputMenuName").val().toLowerCase();

		// ersätt mellanslag med bindesstreck
		while (machineUrl.indexOf(' ') >= 0) {
			machineUrl = machineUrl.replace(" ", "-");
		}
		while (machineUrl.indexOf('--') >= 0) {
			machineUrl = machineUrl.replace("--", "-");
		}
		endUrl = machineUrl;
	});
	

});