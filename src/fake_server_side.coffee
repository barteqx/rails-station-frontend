class @FakeServerSide
  constructor: ->
    @user = null
    @users = []
    user = new User(1, "tester", true)
    @posts = []
    @podcasts = []
    @playlist = {
      current: null,
      episodes: []
    }
    @episodes = {}
    @stream = new Stream(0, "http://188.40.32.140:8172/stream", "Kontestacja")

  getStream: =>
    @stream

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
    @podcasts

  deletePodcast: (podcast) =>

  addPodcast: (podcast) =>
    @podcast.shift(podcast)

  editPodcast: (podcast) =>

  getPodcastEpisodes: (podcast, fromNumber = 0, amount = 10) =>

  deletePodcastEpisode: (episodes) =>

  addPodcastEpisode: (episode) =>

  editPodcastEpisode: (episode) =>

  #admin operations
  getUsers: =>

  editUser: (user) =>

  deleteUser: (user) =>
    delete @users[user.login]

  addUser: (login, email, password, admin) =>
    @users[login] = {
      user: new User(new Date().getTime(), login, email, admin),
      password: password
    }

  getAdminStream: =>
    @getStream()

  setAdminStream: (@stream) => 

  #playlist operations
  getPlaylist: =>

  savePlaylist: (playlist) =>

  #login operations  
  loginUser: (login, pass) =>
    if @users[login][password] == pass
      @loginSuccesful @users[login][user]
    else
      @loginUnsuccessful("Authentication failed - try again.")


  loginSuccesful: (user) =>
    @user = user

  loginUnsuccessful: (message) => 
    @showAlert Alert(message)

  logOut: =>
    @user = null

  showAlert: (message) =>