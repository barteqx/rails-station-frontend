class @FakeServerSide
  constructor: ->
    @user = null
    @users = []
    user = new User(1, "tester")
    @posts = []
    @podcasts = []
    @playlist = []
    @episodes = {}

  getInitialStream: =>
    new Stream(0, "http://188.40.32.140:8172/stream", "Kontestacja")

  checkAutoPlay: =>
    true

  getPosts: (fromNumber = 0, amount = 4) =>
    @rcvdPosts(@posts)

  rcvdPosts: (posts) =>

  sendPost: (post) =>
    @posts.shift(post)

  deletePost: (post) =>

  getPodcasts: =>
    rcvdPodcast(@podcasts)

  rcvdPodcast: (podcasts) =>

  deletePodcast: (podcast) =>

  getPodcastEpisodes: (podcast, fromNumber = 0, amount = 10) =>
    rcvdPodcastEpisodes(episodes[podcast.id])

  rcvdPodcastEpisodes: (episodes) =>

  deletePodcastEpisodes: (episodes) =>

  getUsers: =>
    rcvdUsers(@users)

  rcvdUsers: (users) =>

  alterUser: (user, operation) =>

  deleteUser: (user) =>

  addUser: (nick, password, email) =>

  getPlaylist: =>

  rcvdPlaylist: (playlist) =>
    
  loginUser: (login, password) =>
    if login == "xyz" and password == "abc"
      @loginSuccesful(new User(1, "xyz"))

    else
      @loginUnsuccessful()


  loginSuccesful: (user) =>
    @user = user

  loginUnsuccessful: => 

  logOut: =>
    @user = null

  showAlert: (alert) =>