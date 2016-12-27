
<script lang="coffee">
  vm = {
    props: ['message', 'currentUser', 'friend']

    computed:
      name: ->
        if this.message.user_id == this.currentUser.id
          this.currentUser.name
        else
          this.friend.name


    created: ->
      allmessages = $('.conversation-body')
      allmessages.scrollTop(allmessages.prop("scrollHeight"))


  }
</script>


<template>
  <div class="infos">
    <div class="info"><span class="name">{{ name }}</span></div>
    <div class="markdown">{{message.content}}</div>
    <hr>
  </div>  
</template>


        