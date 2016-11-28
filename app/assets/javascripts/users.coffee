jQuery(document).on 'turbolinks:load', ->

  if $("#current_user").size() > 0
    App.rooms = App.cable.subscriptions.create "RoomsChannel",
      connected: ->

      disconnected: ->

      received: (data) ->
        if $("#notify_apply_friend").size() > 0
          $("#notify_apply_friend").text(data['apply_friend_count'])

        if $("#operate_apply_friend").size() > 0 && data['operate'] == "notify_apply_friend"
          $("#operate_apply_friend").append data["apply_friend"]

