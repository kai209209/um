<script lang="coffee">
  vm = {
    data: ->
      count: 0
      messState: false

    props: ['friend']

    computed:
      socketData: ->
        this.$store.state.socketData

    methods:
      chatNow: (friend) ->
        this.$store.commit('addChatingFriends', friend)
        this.$store.commit('changeCurrentChattingFriend', friend)
        this.messState = false
        this.count = 0

    watch:
      socketData: (val) ->
        if this.$store.state.currentChattingFriend != this.friend && val.operate == 'send_message' && val.message.user_id == this.friend.id
          this.messState = true
          this.count++

  }
</script>

<template>
  <div class="row">
    <div class="col-md-6">
      <a href="#" @click.prevent="chatNow(friend)">{{friend.name}}</a>
    </div>
    <div class="col-md-6" v-if="messState"><a href="#" @click.prevent="chatNow(friend)">新消息({{count}})</div>
  </div>
</template>


        