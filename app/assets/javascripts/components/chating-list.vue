//= require components/conversation

<script lang="coffee">
  vm = {
    data: ->
      chatingCount: 0
      theFriend: ''
      conversationSocketData: ''

    props: ['chatingFriends', 'friend', 'currentUser', 'socketData']

    methods:
      chatingWithFriend: (friend) ->
        this.theFriend = friend

      closeChating: (friend) ->
        if this.theFriend == friend          
          this.theFriend = this.chatingFriends[0]
        this.chatingFriends.splice(this.chatingFriends.indexOf(friend), 1)


    updated: ->
      this.chatingCount = this.chatingFriends.length

    watch:
      friend: (val) ->
        this.theFriend = val

      socketData: (val) ->
        if val.operate == 'send_message'
          this.conversationSocketData = val.message


    components:
      conversation: VCompents['components/conversation']
  }


</script>

<template>
  <div>
    <div class="col-xs-12">
      <div class="row">
        <ul class="nav navbar-nav">
          <li v-for="friend in chatingFriends">
            <div class="btn-group">
              <button @click.prevent="chatingWithFriend(friend)" class="btn btn-default">{{friend.email}}</button>
              <button @click.prevent="closeChating(friend)" class="btn btn-default"><span>x</span></button>
            </div>
          </li>
        </ul>
      </div>
      <div class="row" v-if="chatingCount"> 
        <hr>
        <conversation :friend="theFriend" :current-user="currentUser" :socket-data="conversationSocketData"></conversation>
      </div>
    </div>
  </div>
</template>







