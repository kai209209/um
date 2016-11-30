$("#content-body").empty().append('<%= j render partial: "conversations/conversation", locals: { conversation: @conversation, user_messages: @user_messages, user_message: @user_message, current_user: current_user} %>')

messages = $('.conversation-body')
messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))

if messages.size() > 0
  messages_to_bottom()
  $("#new_user_message").submit (e) ->
    $this = $(@)
    messages_content = $this.find('#user_message_content')
    if $.trim(messages_content.val()).length > 0  
      App.rooms.send_message(messages_content.val(), $this.find("#conversation_id").val())  
      messages_content.val('')
    return false