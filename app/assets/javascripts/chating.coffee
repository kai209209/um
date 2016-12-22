#= require components/chating
#= require components/my-name
#= require components/friend-list
$ ->

  app = new Vue({
    el: '#chating-main'
    data: 
      msg: 'Hi'
      friends: ''#$.ajax({ url: '/users/friends.json'   })

    methods: 
      chatingNow: (friend) ->
        console.log friend

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
    })