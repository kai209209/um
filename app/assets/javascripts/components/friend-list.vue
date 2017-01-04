//= require components/friend
<script lang="coffee">

  vm = {

    props: ['friends']


    components:
      friend: VCompents['components/friend']

    # computed:
    #   socketData: ->
    #     this.$store.state.socketData

    # methods:
    #   chatNow: (friend) ->
    #     this.$store.commit('addChatingFriends', friend)
    #     this.$store.commit('changeCurrentChattingFriend', friend)
  }
</script>

<template>
  <div class="sidebar">
    <div class="panel panel-default">
      <div class="panel-heading">
        <a href="/apply_friends">好友申请</a>
        <span class="pull-right badge">0</span>
      </div>
    </div>

    <div class="panel panel-default">
      <div class="panel-heading">
        <div class="panel-group" role="tablist" aria-multiselectable="true">
          <div class="panel panel-default">
            <div class="panel-heading" role="tab">
              <h4 class="panel-title">
                <a href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" data-toggle="collapse">所有好友</a>
              </h4>
            </div>
            <div class="panel-collapse collapse in" id="collapseOne" role="tabpanel" aria-labelledby="headingOne">
              <div class="panel-body">
                <table class="table table-hover">
                  <tbody>
                    <tr v-for="friend in friends">
                      <friend :friend="friend"></friend>
                      <!-- <td><a href="#" @click.prevent="chatNow(friend)">{{friend.name}}</a></td>
                      <td>操作</td> -->
                    </tr>                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
</template>