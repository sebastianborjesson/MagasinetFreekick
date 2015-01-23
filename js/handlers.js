$(function(){

  


$('.carousel').carousel({
    interval: 2000,
    pause: "hover"

  });

$("header li").click(function() {

    $("header li").addClass('active').not(this).removeClass('active');
    var currentHref = $(this).attr("href");
    $('main').children().hide();
    $('.'+currentHref).show();

});


$(".carousel .btn").click(function() {

  var currentHref = $(this).attr("href");
  $('main').children().hide();
  $('.'+currentHref).show();

});




// $(".sign-in form").submit(function() {

// });



});