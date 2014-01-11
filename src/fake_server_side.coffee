class @FakeServerSide
  constructor: ->
    @user = null

  getInitialStream: =>
    new Stream(0, "http://188.40.32.140:8172/stream", "Kontestacja")

  checkAutoPlay: =>
    true

  getPosts: (fromNumber = 0, amount = 4) =>
    user = new User(1, "tester")
    [new BlogPost(1, "Test fake post", "<b>Fake post no. 1.</b>", user),
    new BlogPost(2, "Test fake post", "<b>Fake post no. 2.</b>", user),
    new BlogPost(2, "Test fake post", "<b>Fake post no. 3.</b>", user),
    new BlogPost(2, "Test fake post", "<b>Fake post no. 4.</b>", user)]

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