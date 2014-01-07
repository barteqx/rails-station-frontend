class Glue
  constructor: (useCases, GUIs, @server_side)->
    
    @useCase, @blogUseCase, @podcastsUseCase, @playlistUseCase = useCases
    @gui, @playlistGUI, @blogGUI, @podcastsGUI = GUIs

    After(@gui, "confirmStreamButtonClicked", (stream) => @useCase.streamProvided(stream))
    After(@useCase, "start", => @gui.refreshPlayer(@server_side.getInitialStream()))
    After(@gui, "getLiveStream", => @gui.refreshPlayer(@server_side.getInitialStream()))

    LogAll(@useCase)
    LogAll(@gui)
    LogAll(@podcastsGUI)
    LogAll(@playlistGUI)
    LogAll(@blogGUI)