class @UseCase
  constructor: ->
    @stream = null
    @playing_playlist = false
    @user = null
    
  start: =>
    @getInitialData()
    
  streamProvided: (stream) =>

  getInitialData: =>

  #login/logout
  loginSuccesful: (user) =>
    @user = user

  logOut: =>
    @user = null

  showAlert: (message) =>