$(function(){
// Start things up
  function start(){

    onPopAndStart();
    $(document).on("click","a",function(event){
      event.preventDefault();
      var thisHref = $(this).attr('href');

      if (!$(this).hasClass("carousel-control")) {
        $('main').children().hide();
        $('.'+thisHref).show();
        console.log("thisHref: ",thisHref);
        getAllMenuLinks(thisHref);

        // Add the current "state/page" to our history
        history.pushState(null,null,thisHref);
      }

    });

    // Add a pop state listener
    // (listen to forward/backward buttons in the browser)
    addEventListener("popstate",onPopAndStart);

    // Run this function on popstate and initial load
    function onPopAndStart(){

      var l = location.href;
      var pageName = l.substring(l.lastIndexOf("/")+1);
      pageName = pageName || "home";
      getAllMenuLinks(pageName);

      console.log("dsad", $('a[href="'+pageName+'"]'));
      $('main').children().hide();
      $('.'+pageName).show();
    }
  }
  start();
});