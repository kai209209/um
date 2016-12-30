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
        this.chatingFriends.splice(this.chatingFriends.indexOf(friend), 1)
        if this.chatingFriends.length > 0
          this.theFriend = this.chatingFriends[0]

      showFriend: (selectfriend) ->
        if this.theFriend == selectfriend
          true
        else
          false


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
        <transition-group name="fade" tag="div" appear>
            <conversation v-for="selectfriend in chatingFriends" v-bind:key='selectfriend' :friend="selectfriend" :current-user="currentUser" v-if="showFriend(selectfriend)" :socket-data="conversationSocketData"></conversation> 
        </transition-group>          
    
      </div>
    </div>
  </div>
</template>




