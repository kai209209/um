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
      currentUser: ''

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

      $.ajax({ 
        url: '/users/profile.json'
        success: (data)->
          _self.currentUser = data.currentUser
         })


    components: 
      chatingList: VCompents['components/chating']
      myName: VCompents['components/my-name']
      friendList: VCompents['components/friend-list']
      chatingList: VCompents['components/chating-list']
    })