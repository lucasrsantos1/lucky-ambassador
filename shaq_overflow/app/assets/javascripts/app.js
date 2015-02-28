$(document).ready(function() {

 $("a.up-vote-answer").click(function(event) {
      event.preventDefault();
      var $target = $(event.target);
      $.ajax({
        type: "post",
        url: $target.data("url"),
        data: $target.data(),
        success: function(response) {
          $('#' + $target.data('answer-id')).empty();
          $('#' + $target.data('answer-id')).append(response)
        }
      });
    }
  );

 $("a.up-vote-question").click(function(event) {
      event.preventDefault();
      var $target = $(event.target);
      console.log($target.data("url"))
      $.ajax({
        type: "post",
        url: $target.data("url"),
        data: $target.data(),
        success: function(response) {
          console.log(response);
          $('#' + $target.data('question-id')).empty();
          $('#' + $target.data('question-id')).append(response)
        }
      });
    }
  );

});