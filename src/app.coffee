#<< utils
#<< local_storage
#<< use_case
#<< gui
#<< glue
#<< fake_server_side
#<< models

class App
  constructor: ->
    useCase      = new UseCase()
    gui          = new Gui()
    server_side  = new FakeServerSide()
    glue         = new Glue(useCase, gui, server_side)
    
    useCase.start()
    window.useCase = useCase

$(document).ready ->
  new App()

  $("a.jp-play").click( -> $("a.jp-pause").css("display", "block"))