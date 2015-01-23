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
    $('#'+currentHref).show();

});

$(".carousel .btn").click(function() {

  var currentHref = $(this).attr("href");
  $('main').children().hide();
  $('.'+currentHref).show();

});

$("header button").click(function() {
  $("header li, button").removeClass('active');
  $("header button").addClass('active');

  $('main').hide();
  // $('main .sign-in pageForm')(200);
});

$(".sign-in form").submit(function() {

});



});