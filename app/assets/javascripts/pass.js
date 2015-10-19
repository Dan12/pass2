function passSetup(){
  var curDate = new Date();
  var MS_PER_MINUTE = 60000;
  var tOffset = curDate.getTimezoneOffset();
  var adjDate = new Date(curDate.valueOf() - tOffset * MS_PER_MINUTE);
  $("#pass_date").val(adjDate.toISOString().slice(0,10));
  $("#pass_time").val(adjDate.toISOString().slice(11,19));
  $("#pass_time_offset").val(tOffset);
  
  $("#teacher_search_input").keydown(function(){
    $.ajax({
      type: "POST",
      url: "/passes/teacher_search",
      data: {partial_name: $("#teacher_search_input").val()},
      success: function(data, textStatus, jqXHR) {
        console.log(data);
        console.log(textStatus);
        console.log(jqXHR);
      },
      error: function(jqXHR, textStatus, errorThrown) {
          alert("Error=" + errorThrown);
      }
    });
  });
}