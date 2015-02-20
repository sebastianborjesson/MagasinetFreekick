
function showPage(pageName) {
  console.log("pageName: ", pageName);
  
  getAllMenuLinks(pageName);

  if (pageName != "sign-in" && pageName != "home") {
    //getpage ajax
    $.ajax ({
      url: "php/get_page.php",
      dataType: "json",
      data: {
        "get_page" : pageName
      },
      success: function(data) {
        console.log("showPage success: ", data);
        
        
        $(".pageContent").html('');
        $(".pageContent").append("<article class='pageMaterial'/>");
        $(".pageContent").show();
        
        $(".pageMaterial").append('<div class="panel panel-default"><div class="panel-heading"><h1 class="panel-title">'+data[0]["title"]+'</h1></div>'+'<div class="panel panel-body"><p>'+data[0]["body"]+'</p></div></div>');
        


      },
      error: function(data) {
        console.log("showPage error: ", data.responseText);
      }
    });

    //then change url to id of section to show
    pageName = "pageContent";
  }

  $('main').children().hide();
  $('.'+pageName).show();
}


$(function(){
// Start things up
  function start(){

    onPopAndStart();
    $(document).on("click","a",function(event){
      event.preventDefault();
      var thisHref = $(this).attr('href');

      if (!$(this).hasClass("carousel-control")) {
        showPage(thisHref);

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

      showPage(pageName);
    }
  }
  start();
});