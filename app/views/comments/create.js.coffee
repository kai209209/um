if $("#replies").size() > 0
  $("#replies .items").append('<%= j render @comment%>')
else
  $(".no-result").after('<%= j render partial: "topics/reply_all", locals: {comments: @topic.comments} %>')
  $(".no-result").remove()

$(".topic-editor").val('')