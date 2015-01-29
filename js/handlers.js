$(function(){

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
							tableData.append('<td>'+data[i].title+"</td>");
							tableData.append('<td>'+data[i].author+"</td>");
							tableData.append('<td>'+data[i].created+"</td>");
							tableData.append('<td><button class="btn btn-xs">Edit</button></td>');

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


	$('.carousel').carousel({
		interval: 2000,
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

	$(".sign-in-button").click(function(){

		$(".pageForm").show();
		$(".content-list").hide();


	});


	$(".sign-in .update").click(function(){

		$(".pageForm").hide();
		$(".content-list").show();
		getPages();

	});


	


});