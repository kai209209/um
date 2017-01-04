#= require components/friend-list
#= require components/chating-list
$ ->

  app = new Vue({
    el: '#chating-main'
    store,
    data: 
      msg: 'Hi'
      friends: ''
      chatingFriends: []
      friend: ''
      socketData: ''

    methods: 
      setVueData: (data) ->
        this.$store.commit('setWebSocketData', data)

    created: ->
      _self = this
      $.ajax({ 
        url: '/users/friends.json'
        success: (data)->
          _self.friends = data
         })

    components:
      friendList: VCompents['components/friend-list']
      chatingList: VCompents['components/chating-list']
    })

  chat = new UserChat(app)