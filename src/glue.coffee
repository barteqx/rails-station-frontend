class Glue
  constructor: (@useCase, @gui)->
    
    After(@gui, "confirmStreamButtonClicked", (stream) => @useCase.streamProvided(stream))
    After(@useCase, "start", => @gui.refreshPlayer("http://"))

    LogAll(@useCase)
    LogAll(@gui)