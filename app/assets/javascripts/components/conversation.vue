//= require components/message

<script lang="coffee">
  vm = {
    props: ['friend', 'currentUser']

    data: ->
      conversation: ''
      userMessages: ''
      content: ''

    methods:
      sendMessage: ->
        value = this.content && this.content.trim()
        if !value
          return

        _self = this

        $.ajax({
          url: '/user_messages.json'
          type: 'POST'
          data:
            content: this.content
            conversation_id: this.conversation.id
          success: (data) ->
            _self.userMessages.push(data)
            _self.rollHeight            
          })

        this.content = ''

      rollthHeight: (st)->     
        allmessages = $('.conversation-body')
        allmessages.scrollTop(allmessages.prop("scrollHeight"))

    created: -> 
      _self = this
      $.ajax({ 
        url: '/conversations/chat_with_friend_conversation.json'
        data: {friend_id: this.friend.id}
        success: (data)->
          _self.conversation = data.conversation
          _self.userMessages = data.userMessages
          Vue.nextTick ->
            _self.rollthHeight(1)
         })


    updated: ->
      this.rollthHeight(1)

    watch:
      friend: (val, oldVal)->
        _self = this
        $.ajax({
          url: '/conversations/chat_with_friend_conversation.json'
          data: {friend_id: val.id}
          success: (data)->
            _self.conversation = data.conversation
            _self.userMessages = data.userMessages
           })    

    components:
      message: VCompents['components/message']    

  }
</script>

<template>
  <div id="conversation-main">
    <div class="conversation-body items" :data-conversation-id="conversation.id">
      <message v-for="message in userMessages" :message="message" :current-user="currentUser" :friend="friend"></message> 
    </div>
    <div class="form-group">
      <textarea class="form-control" rows='5' v-model='content' >
    </div>

    <div class="form-group">
      <button class="btn btn-default btn-sm" @click='sendMessage'>发送</button>
    </div>
  </div>
</template>



