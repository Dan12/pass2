$(document).ready(function(){
  $(window).bind('page:change', function() {
    if($("#create_pass_form").html() !== undefined){
      passSetup();
    }
  });
});