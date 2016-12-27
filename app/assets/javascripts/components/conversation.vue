//= require components/message

<script lang="coffee">
  vm = {
    props: ['friend', 'currentUser']

    data: ->
      conversation: ''
      userMessages: ''

    created: -> 
      _self = this
      $.ajax({ 
        url: '/conversations/chat_with_friend_conversation.json'
        data: {friend_id: this.friend.id}
        success: (data)->
          _self.conversation = data.conversation
          _self.userMessages = data.userMessages
         })

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
  </div>
</template>



