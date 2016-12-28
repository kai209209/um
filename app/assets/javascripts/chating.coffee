#= require components/chating
#= require components/my-name
#= require components/friend-list
#= require components/chating-list

$ ->

  app = new Vue({
    el: '#chating-main'
    data: 
      msg: 'Hi'
      friends: ''
      chatingFriends: []
      friend: ''

    methods: 
      chatingNow: (friend) ->
        unless friend in this.chatingFriends
          this.chatingFriends.push(friend)
        this.friend = friend

    created: ->
      _self = this
      $.ajax({ 
        url: '/users/friends.json'
        success: (data)->
          _self.friends = data
         })

    components: 
      chatingList: VCompents['components/chating']
      myName: VCompents['components/my-name']
      friendList: VCompents['components/friend-list']
      chatingList: VCompents['components/chating-list']
    })