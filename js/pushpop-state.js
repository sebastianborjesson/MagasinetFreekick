$(function(){
// Start things up
  function start(){

    onPopAndStart();
    $(document).on("click","a",function(event){
      event.preventDefault();
      var thisHref = $(this).attr('href');
      $('main').children().hide();
      $('.'+thisHref).show();
      console.log("thisHref: ",thisHref);

      if ($(this).attr("a") && $(this).attr("a") !== "#") {
        $(this).parents(".carousel").show();
    }
      // Add the current "state/page" to our history
      history.pushState(null,null,thisHref);

    });

    // Add a pop state listener
    // (listen to forward/backward buttons in the browser)
    addEventListener("popstate",onPopAndStart);

    // Run this function on popstate and initial load
    function onPopAndStart(){

      var l = location.href;
      var pageName = l.substring(l.lastIndexOf("/")+1);
      pageName = pageName || "home";


      $('header .active').removeClass('active');
      $('.'+pageName+"-button").addClass('active');
      $('main').children().hide();
      $('.'+pageName).show();
    }
  }
  start();
});