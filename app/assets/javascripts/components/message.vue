
<script lang="coffee">
  vm = {
    props: ['message', 'friend']

    computed:
      currentUser: ->
        this.$store.state.currentUser

      name: ->
        if this.message.user_id == this.currentUser.id
          this.currentUser.name
        else
          this.friend.name

      messageColor: ->
        if this.message.user_id == this.currentUser.id
          'bg-info reply infos col-md-11'
        else
          'bg-success reply infos col-md-11'

      avatar: ->
        if this.message.user_id == this.currentUser.id
          avatar = this.currentUser.avatar.replace('public', '')
        else
          avatar = this.friend.avatar.replace('public', '')

    filters:
      formatDate: (v) ->
        moment(v).format('YYYY-MM-DD HH:mm')

  }
</script>


<template>
  <div class="reply">
    <dir class="col-md-1">
      <img :src="avatar" height="40" width="40">
    </dir>
    <div :class="messageColor">
      <div class="info"><span class="name">{{ name }}</span>·<span class="time">{{ message.created_at | formatDate}}</span></div>
      <div class="markdown"><span >{{message.content}}</span></div>
      <hr>
    </div>  
  </div>
</template>


        