jQuery(document).on 'turbolinks:load', ->

  if $("#current_user").size() > 0
    App.rooms = App.cable.subscriptions.create "RoomsChannel",
      connected: ->

      disconnected: ->

      received: (data) ->

