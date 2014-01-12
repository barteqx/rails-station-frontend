class @BlogUseCase
  constructor: ->
    @posts = []

  getPosts: (fromPost = 0, amount = 4) =>

  rcvdPosts: (@posts) =>

  addPost: (post) =>
    @posts.shift(post)

  editPost: (post) =>

  deletePost: (post) =>

