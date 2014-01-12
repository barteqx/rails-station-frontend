class @FakeServerSide
  constructor: ->
    @user = null
    @users = []
    user = new User(1, "tester")
    @posts = []
    @podcasts = []
    @playlist = []
    @episodes = {}

  getStream: =>
    new Stream(0, "http://188.40.32.140:8172/stream", "Kontestacja")

  checkAutoPlay: =>
    true

  #blog operations
  getPosts: (fromNumber = 0, amount = 4) =>

  addPost: (post) =>
    @posts.shift(post)

  editPost: (post) =>

  deletePost: (post) =>

  #podcast catalog operations
  getPodcasts: =>

  deletePodcast: (podcast) =>

  addPodcast: (podcast) =>

  editPodcast: (podcast) =>

  getPodcastEpisodes: (podcast, fromNumber = 0, amount = 10) =>

  deletePodcastEpisode: (episodes) =>

  addPodcastEpisode: (episode) =>

  editPodcastEpisode: (episode) =>

  #admin operations
  getUsers: =>

  editUser: (user, operation) =>

  deleteUser: (user) =>

  addUser: (nick, password, email) =>

  #playlist operations
  getPlaylist: =>

  savePlaylist: (playlist) =>

  #login operations  
  loginUser: (login, password) =>
    if login == "xyz" and password == "abc"
      @loginSuccesful(new User(1, "xyz"))

    else
      @loginUnsuccessful("Authentication failed - try again.")


  loginSuccesful: (user) =>
    @user = user

  loginUnsuccessful: (message) => 
    @showAlert Alert(message)

  logOut: =>
    @user = null

  showAlert: (message) =>