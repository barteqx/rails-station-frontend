class Glue
  constructor: (@useCase, @gui, @server_side)->
    
    After(@gui, "confirmStreamButtonClicked", (stream) => @useCase.streamProvided(stream))
    After(@useCase, "start", => @gui.refreshPlayer(@server_side.getInitialStream()))

    LogAll(@useCase)
    LogAll(@gui)