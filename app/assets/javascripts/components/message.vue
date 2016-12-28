
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

    filters:
      formatDate: (v) ->
        moment(v).format('YYYY-MM-DD HH:mm')
  }
</script>


<template>
  <div class="reply">
    <dir class="avatar">
      <img src="assets/image.jpg" height="30" width="30">
    </dir>
    <div class="infos">
      <div class="info"><span class="name">{{ name }}</span>·<span class="time">{{ message.created_at | formatDate}}</span></div>
      <div class="markdown"><span class="">{{message.content}}</span></div>
      <hr>
    </div>  
  </div>
</template>


        