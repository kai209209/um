//= require components/conversation

<script lang="coffee">
  vm = {
    data: ->
      chatingCount: 0
      theFriend: ''

    props: ['chatingFriends', 'friend']

    methods:
      chatingWithFriend: (friend) ->
        this.friend = friend

      closeChating: (friend) ->
        this.chatingFriends.splice(this.chatingFriends.indexOf(friend), 1)


    updated: ->
      this.chatingCount = this.chatingFriends.length
      this.theFriend = this.friend


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
        <conversation :friend="theFriend"></conversation>        
      </div>
    </div>
  </div>
</template>







