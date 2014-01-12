class @AdminUseCase
  constructor: ->
    @users = []
    @stream = null

  createUser: (login, email, password, access = "normal") =>

  deleteUser: (user) =>

  editUser: (user, changes) =>

  getUsers: =>

  rcvdUsers: (@users) =>

  getStream: =>

  setStream: (stream) => 

  rcvdStream: (@stream) =>