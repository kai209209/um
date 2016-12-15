if $("#content_html_preview").size() < 1
  $(".the_content_form").append('<div id="content_html_preview"><%= j @content_html %></div>')
else
  $("#content_html_preview").html('<%= j @content_html %>')