class Gui
  constructor: ->

  createElementFor: (templateId, data) =>
    source = $(templateId).html()
    template = Handlebars.compile(source)
    html = template(data)
    element = $(html)
  
  showAskForStream: =>
    element = @createElementFor("#ask-for-stream-template")
    $(".main").append(element)
    confirmStreamButton = $("#submit-stream-button")
    confirmStreamButton.click( => @confirmStreamButtonClicked($("#stream").val()))
    $("#stream").focus()
    
  confirmStreamButtonClicked: (stream) =>

  hideAskForStream: =>
    $(".ask-for-stream").remove()


  showStream: (stream) =>
    element = @createElementFor("#stream-playing-template", {stream : stream})

    $("#stream-player").jPlayer(
            ready: (event) ->
              $(this).jPlayer "setMedia",
                mp3: "http://jplayer.org/audio/mp3/TSP-01-Cro_magnon_man.mp3"
            preload: "auto",
            swfPath: "/",
            solution: "html, flash",
            supplied: 'mp3')
    $(".main").append(element)
    $("#restart-link").click( => @restartClicked())

  restartClicked: =>

  hideStream: =>
    $(".greet-message").remove()