class @Glue
  constructor: (useCases, GUIs, @server_side, @local_storage)->
    
    [@useCase, @blogUseCase, @podcastsUseCase, @playlistUseCase, @adminUseCase] = useCases
    [@gui, @playlistGUI, @blogGUI, @podcastsGUI, @adminGUI] = GUIs

    #Initial
    After(@useCase, "start", => @gui.refreshPlayer(@server_side.getStream()))
    #Login
    After(@gui, "loginUser", (login, password) => @useCase.loginUser(login, password))
    After(@useCase, "loginUser", (login, password) => @server_side.loginUser(login, password))

    #Authentication successful
    After(@server_side, "loginSuccessful", (user) => @useCase.loginSuccessful(user))
    After(@useCase, "loginSuccessful", (user) => @gui.loginSuccessful(user))
   
    #Logout   
    After(@gui, "logOut", => @useCase.logOut())
    After(@useCase, "logOut", => @server_side.logOut())

    #showing alerts
    After(@server_side, "showAlert", (message) => @gui.showAlert(message))
    After(@server_side, "showAlert", (message) => @gui.showAlert(message))

    #Get live stream
    After(@gui, "getLiveStream", => @gui.refreshPlayer(@server_side.getStream()))

    ### Playlist Glue ###

    After(@playlistUseCase, "getPlaylist", => rcvdPlaylist(@server_side.getPlaylist()))

    After(@playlistGUI, "toggleLoop", => @playlistUseCase.toggleLoop())
    After(@playlistGUI, "toggleDeleteAfterListened", => @playlistUseCase.toggleDeleteAfterListened())

    After(@playlistGUI, "play", => @playlistUseCase.play())
    After(@playlistGUI, "pause", => @playlistUseCase.pause())
    After(@playlistGUI, "stop", => @playlistUseCase.stop())

    After(@playlistGUI, "playNext", => @playlistUseCase.playNext())
    After(@playlistGUI, "popEpisode", (i) => @playlistUseCase.popEpisode(i))
    After(@playlistGUI, "changeEpisode", (n) => @playlistUseCase.changeEpisode(n))

    #Save playlist after modifications
    After(@playlistUseCase, "addEpisode", (episode) => @server_side.savePlaylist(@playlistUseCase.playlist))
    After(@playlistUseCase, "rearrange", (fromPos, toPos) => @server_side.savePlaylist(@playlistUseCase.playlist))
    After(@playlistUseCase, "popEpisode", (i) => @server_side.savePlaylist(@playlistUseCase.playlist))
    After(@playlistUseCase, "changeEpisode", (i) => @server_side.savePlaylist(@playlistUseCase.playlist))
    After(@playlistUseCase, "playNext", => @server_side.savePlaylist(@playlistUseCase.playlist))

    ### Admin Glue ###

    #Adding a user
    After(@adminGUI, "addUser", (login, email, password, admin) => @adminUseCase.addUser(login, email, password, admin))
    After(@adminUseCase, "addUser", (login, email, password, admin) => @server_side.addUser(login, email, password, admin))

    #Deleting a user
    After(@adminGUI, "addUser", (user) => @adminUseCase.deleteUser(user))
    After(@adminUseCase, "addUser", (login, email, password, admin) => @server_side.addUser(login, email, password, admin))


    LogAll(@useCase)
    LogAll(@podcastsUseCase)
    LogAll(@blogUseCase)
    LogAll(@playlistUseCase)
    LogAll(@adminUseCase)

    LogAll(@gui)
    LogAll(@podcastsGUI)
    LogAll(@playlistGUI)
    LogAll(@blogGUI)
    LogAll(@adminGUI)