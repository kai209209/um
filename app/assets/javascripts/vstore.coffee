window.store = new (Vuex.Store)(
  state:
    chatingFriends: []
    currentChattingFriend: ''
    currentUser: ''
    socketData: ''


  mutations:
    addChatingFriends: (state, friend) ->
      unless friend in state.chatingFriends
        state.chatingFriends.push(friend)

    removeChatingFriends: (state, friend) ->
      state.chatingFriends.splice(state.chatingFriends.indexOf(friend), 1)
      if state.chatingFriends.length > 0
        state.currentChattingFriend = state.chatingFriends[0]
      else
        state.currentChattingFriend = ''

    changeCurrentChattingFriend: (state, friend) ->
      state.currentChattingFriend = friend

    setCurrentUser: (state, friend) ->
      state.currentUser = friend

    setWebSocketData: (state, data) ->
      state.socketData = data

)