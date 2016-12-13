# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery(document).on 'ready', ->
  $("#topic_preview").click ->
    content = $(@).parents("form").find("#topic_content")
    if $.trim(content.val()).length > 0  
      content_html = $.ajax({url: $(@).data('path'), data: {content: content.val()}})
      console.log content_html
      content.hide()
      $("#topic_content_form").html(content_html.responseText)
      false