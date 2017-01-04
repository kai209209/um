//= require components/message

<script lang="coffee">
  vm = {
    props: ['friend', 'socketData']

    data: ->
      conversation: ''
      userMessages: []
      content: ''

    computed: 
      currentUser: ->
        this.$store.state.currentUser

      socketData: ->
        this.$store.state.socketData

      reverseUserMessages: ->
        this.userMessages.reverse()
      

    methods:
      sendMessage: ->
        value = this.content && this.content.trim()
        if !value
          return

        messageProperty = {
          id: 'null'
          content: this.content
          user_id: this.currentUser.id
          conversation_id: this.conversation.id
        }

        this.userMessages.push(messageProperty)
        messageIndex = this.userMessages.indexOf(messageProperty)

        $this = this

        $.ajax({
          url: '/user_messages.json'
          type: 'POST'
          data:
            content: this.content
            conversation_id: this.conversation.id
          success: (data) ->
            $this.userMessages.splice(messageIndex, 1, data)
            $this.rollHeight            
          })

        this.content = ''

      rollthHeight: (st)->     
        allmessages = $('.conversation-body')
        allmessages.scrollTop(allmessages.prop("scrollHeight"))

    created: -> 
      $this = this
      $.ajax({ 
        url: '/conversations/chat_with_friend_conversation.json'
        data: {friend_id: this.friend.id}
        success: (data)->
          $this.conversation = data.conversation
          $this.userMessages = data.userMessages
          Vue.nextTick ->
            $this.rollthHeight(1)
         })


    updated: ->
      this.rollthHeight(1)

    watch:
      friend: (val) ->
        $this = this
        $.ajax({
          url: '/conversations/chat_with_friend_conversation.json'
          data: {friend_id: val.id}
          success: (data)->
            $this.conversation = data.conversation
            $this.userMessages = data.userMessages
           })    

      socketData: (val) ->
        if val.operate == 'send_message' && val.conversation_id == this.conversation.id
          this.userMessages.push(val.message)


    components:
      message: VCompents['components/message']    

  }
</script>

<template>
  <div id="conversation-main">
    <div class="conversation-body items" :data-conversation-id="conversation.id">
      <message v-for="message in reverseUserMessages" :message="message" :friend="friend"></message> 
    </div>
    <div class="form-group">
      <textarea class="form-control" rows='5' v-model='content' >
    </div>

    <div class="form-group">
      <button class="btn btn-default btn-sm" @click='sendMessage'>发送</button>
    </div>
  </div>
</template>



