class @Glue
  constructor: (useCases, GUIs, @server_side)->
    
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

    LogAll(@useCase)
    LogAll(@gui)
    LogAll(@podcastsGUI)
    LogAll(@playlistGUI)
    LogAll(@blogGUI)