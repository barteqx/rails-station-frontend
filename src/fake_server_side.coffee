class @FakeServerSide
  constructor: ->
    @user = null
    user = new User(1, "tester")
    @posts = [new BlogPost(1, "Test fake post", "<b>Fake post no. 1.</b>", user), new BlogPost(2, "Test fake post", "<b>Fake post no. 2.</b>", user), new BlogPost(2, "Test fake post", "<b>Fake post no. 3.</b>", user), new BlogPost(2, "Test fake post", "<b>Fake post no. 4.</b>", user)]
    @podcasts = []
    @episodes = []

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

  getPodcastEpisodes: (fromNumber = 0, amount = 10) =>
    rcvdPodcastEpisodes(episodes)

  rcvdPodcastEpisodes: (episodes) =>
    
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