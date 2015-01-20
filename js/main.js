$(function(){

	$('.carousel').carousel({
		interval: 3000,
		pause: "hover"

	});

	$("header li").click(function(){
      $("header li").addClass('active').not(this).removeClass('active');
      var currentHref = $(this).attr("href");
      $('main').children().hide();
      $('.'+currentHref).show();


    });

});