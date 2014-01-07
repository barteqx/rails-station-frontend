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


class App
  constructor: ->
    #usecases
    useCases = [ new UseCase(),
                 new BlogUseCase(),
                 new PodcastsUseCase(),
                 new PlaylistUseCase() 
               ]
               
    GUIs = [ new GUI(),
             new PlaylistGUI(),
             new BlogGUI(),
             new PodcastsGUI() 
           ]

    server_side  = new FakeServerSide()
    glue         = new Glue(useCases, GUIs, server_side)
    
    useCases[0].start()
    window.useCase = useCases[0]

$(document).ready ->
  new App()

  $("a.jp-play").click( -> $("a.jp-pause").css("display", "block"))