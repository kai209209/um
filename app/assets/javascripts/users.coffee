jQuery(document).on 'turbolinks:load', ->
  $(document).on 'click', '.notification .close', ->
    $(this).parents('.notification').fadeOut(1000)

  if $("#current_user").size() > 0
    App.rooms = App.cable.subscriptions.create "RoomsChannel",
      connected: ->

      disconnected: ->

      send_message: (messages, conversation_id) ->
        @perform 'send_message', messages: messages, conversation_id: conversation_id

      received: (data) ->
        switch data['operate']
          when "notify_apply_friend"
            @operate_notify_apply_friend(data)
            
          when "notify_friends_relationship"
            @operate_notify_friends_relationship(data)

          when "send_message"
            @operate_send_message(data)
            

      operate_notify_apply_friend: (data) ->
        if $("#notify_apply_friend").size() > 0 && data['apply_friend_count'] > 0
          $("#notify_apply_friend").text(data['apply_friend_count'])

        if $("#operate_apply_friend").size() > 0
          $("#operate_apply_friend").append(data["apply_friend"])

        if $("#operate_apply_friend").size() < 1
          $("body").append(data['apply_friend_notification'])

      operate_notify_friends_relationship: (data) ->
        if $("#my_all_friends").size() > 0
          $("#my_all_friends").empty().append(data["new_friends_relationship"])

        $("body").append(data['friends_relationship_notification'])

      operate_send_message: (data) ->
        messages = $('.conversation-body')
        messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))

        if $(".conversation-body").size() > 0 && messages.data('conversation-id') == data['conversation_id']
          messages.append(data['message'])
          messages_to_bottom()
        else
          $('body').append(data['notification'])












