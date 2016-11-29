jQuery(document).on 'turbolinks:load', ->
  $(document).on 'click', '.notification .close', ->
    $(this).parents('.notification').fadeOut(1000)

  if $("#current_user").size() > 0
    App.rooms = App.cable.subscriptions.create "RoomsChannel",
      connected: ->

      disconnected: ->

      received: (data) ->
        if $("#notify_apply_friend").size() > 0 && data['apply_friend_count'] > 0
          $("#notify_apply_friend").text(data['apply_friend_count'])

        if $("#operate_apply_friend").size() > 0 && data['operate'] == "notify_apply_friend"
          $("#operate_apply_friend").append(data["apply_friend"])

        if $("#operate_apply_friend").size() < 1 && data['operate'] == "notify_apply_friend"
          $("body").append(data['apply_friend_notification'])

        if $("#my_all_friends").size() > 0 && data['operate'] == "notify_friends_relationship"
          $("#my_all_friends").empty().append(data["new_friends_relationship"])

        if data['operate'] == "notify_friends_relationship"
          $("body").append(data['friends_relationship_notification'])



