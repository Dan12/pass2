function passSetup(){
  var curDate = new Date();
  var MS_PER_MINUTE = 60000;
  var tOffset = curDate.getTimezoneOffset();
  var adjDate = new Date(curDate.valueOf() - tOffset * MS_PER_MINUTE);
  $("#pass_datetime").val(adjDate.toISOString().slice(0,17)+"00");
  console.log(adjDate.toISOString().slice(0,19))
  $("#pass_time_offset").val(tOffset);
  
  $("#teacher_search_input").keyup(function(){
    $.ajax({
      type: "POST",
      url: "/passes/teacher_search",
      data: {partial_name: $("#teacher_search_input").val()},
      success: function(data, textStatus, jqXHR) {
        console.log(data.teachers);
        $("#teacher_search_results div").remove();
        for(var i = 0; i < data.teachers.length; i++){
          $("#teacher_search_results").append("<div class='teacher_search_result' user_name='"+data.teachers[i].name+" ("+data.teachers[i].email+")' user_id='"+data.teachers[i].id+"'>"+data.teachers[i].name+" ("+data.teachers[i].email+")</div>")
        }
        $(".teacher_search_result").click(function(){
          $("#pass_teacher_to_id").val($(this).attr("user_id"));
          $("#teacher_search_input").val($(this).attr("user_name"));
          $("#teacher_search_results div").remove();
        });
      },
      error: function(jqXHR, textStatus, errorThrown) {
          console.log("Error=" + errorThrown);
      }
    });
  });
}