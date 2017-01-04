//= require components/conversation

<script lang="coffee">
  vm = {
    data: ->
      chatingCount: 0

    props: ['currentUser']

    methods:
      chatingWithFriend: (friend) ->
        this.$store.commit('changeCurrentChattingFriend', friend)

      closeChating: (friend) ->
        this.$store.commit('removeChatingFriends', friend)

      showFriend: (selectfriend) ->
        if this.currentChattingFriend == selectfriend
          true
        else
          false

    computed:

      chatingFriends: ->
        this.$store.state.chatingFriends

      currentChattingFriend: ->
        this.$store.state.currentChattingFriend

    created: ->
      this.$store.commit('setCurrentUser', this.currentUser)

    updated: ->
      this.chatingCount = this.chatingFriends.length

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
            <conversation v-for="selectfriend in chatingFriends" v-bind:key='selectfriend' :friend="selectfriend" v-if="showFriend(selectfriend)"></conversation> 
        </transition-group>          
    
      </div>
    </div>
  </div>
</template>




