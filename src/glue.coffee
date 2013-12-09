class Glue
  constructor: (@useCase, @gui)->
    After(@useCase, "askForStream", => @gui.showAskForStream())
    After(@useCase, "streamProvided", => @gui.hideAskForStream())
    After(@useCase, "showStream", (stream) => @gui.showStream(stream))
    After(@useCase, "restart", => @gui.hideStream())
    
    After(@gui, "restartClicked", => @useCase.restart())
    After(@gui, "confirmStreamButtonClicked", (stream) => @useCase.streamProvided(stream))

    LogAll(@useCase)
    LogAll(@gui)