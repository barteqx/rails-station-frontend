#<< utils
#<< local_storage
#<< use_case
#<< gui
#<< glue
#<< models
#<< fake_server_side
#<< playlist_gui
#<< blog_gui
#<< podcasts_gui
#<< blog_usecase
#<< podcasts_usecase
#<< playlist_usecase
#<< admin_gui
#<< admin_usecase


class App
  constructor: ->

    use_cases = [ new UseCase(), new BlogUseCase(), new PodcastsUseCase(), new PlaylistUseCase(), new AdminUseCase]

    guis = [ new GUI(), new PlaylistGUI(), new BlogGUI(), new PodcastsGUI(), new AdminGUI]

    server_side  = new FakeServerSide()
    glue         = new Glue(use_cases, guis, server_side)
    local_storage = new LocalStorage("station")
    
    use_cases[0].start()
    window.useCase = use_cases[0]

$(document).ready ->
  new App()

  $("a.jp-play").click( -> $("a.jp-pause").css("display", "block"))