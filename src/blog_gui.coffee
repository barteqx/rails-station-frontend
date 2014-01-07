class @BlogGUI
  constructor: ->

    @getPosts(0, 4)

  createElementFor: (templateId, data) =>
    source = $(templateId).html()
    template = Handlebars.compile(source)
    html = template(data)
    element = $(html)

  #triggers
  getPosts: (fromNumber, quantity) =>

  getPost: (post_id) =>

  newPost: =>

  editPost: (post_id) =>

  savePost: (title, content, user, id = null) =>

  deletePost: (post_id) =>

  #triggered
  listPosts: (posts) =>

  showPost: (post) =>