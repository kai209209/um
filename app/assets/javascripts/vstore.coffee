window.store = new (Vuex.Store)(
  state: 
    count: 0
    chatingFriends: []
    currentChattingFring: ''



  mutations: 
    increment: (state) ->
      state.count++


)