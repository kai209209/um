//= require components/conversation

<script lang="coffee">
  vm = {
    data: ->
      chatingCount: 0
      theFriend: ''

    props: ['chatingFriends', 'friend', 'currentUser']

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
      friend: (val, oldVal) ->
        this.theFriend = val

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
        <conversation :friend="theFriend" :current-user="currentUser"></conversation>
      </div>
    </div>
  </div>
</template>







