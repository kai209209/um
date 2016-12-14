# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery(document).on 'ready', ->
  $(".editor-toolbar ul li.edit a").click ->
    $("#topic_content").show()
    $(@).parent().addClass("active")
    $(".editor-toolbar ul li.preview").removeClass("active")
    $("#content_html_preview").remove()
    false


  $(".editor-toolbar ul li.preview a").click ->
    $("#topic_content").hide()
    $(@).parent().addClass("active")
    $(".editor-toolbar ul li.edit").removeClass("active")
    content = $(@).parents("form").find("#topic_content")
    $.ajax({url: $(@).attr('href'), data: {content: content.val()}})
    false
