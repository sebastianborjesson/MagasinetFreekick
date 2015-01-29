$(function(){

  


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


	});


	


});