$(function() {
    $(".custom_error_message, .error").on("click", function(event) {
      return $(event.target).hide("slow");
    });
    return $('.alert').alert();
  });