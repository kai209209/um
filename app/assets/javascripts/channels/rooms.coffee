class UserChat
  constructor: (@app = null)->
    $this = this
    if $("#current_user").size() > 0
      App.rooms = App.cable.subscriptions.create "RoomsChannel",
        connected: ->

        disconnected: ->

        received: (data) ->
          $this.setVueData(data)


  setVueData: (data) ->
    @app.setVueData(data)


window.UserChat = UserChat
