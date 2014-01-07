class Gui
  constructor: ->

    @confirmStreamButton = $("#submit-stream-button")
    @confirmStreamButton.click( => @confirmStreamButtonClicked(new Stream(1,$("#stream").val(), "Test")))
    $("#podcasts-playlist").sortable()
    $("#podcasts-playlist").selectable()
    $('#play_livestream').click( => @getLiveStream())
    @playerUI = $("#jp_container_1")
    @player = $("#jquery_jplayer_1")

    

  createElementFor: (templateId, data) =>
    source = $(templateId).html()
    template = Handlebars.compile(source)
    html = template(data)
    element = $(html)

  refreshPlayer: (source) =>

    @player.jPlayer "clearMedia"

    if (source.type == "stream")
      @playerUI.removeClass("jp-audio")
      @playerUI.addClass("jp-audio-stream")

    else 
      @playerUI.removeClass("jp-audio-stream")
      @playerUI.addClass("jp-audio")

    stream = source.source

    @player.jPlayer "setMedia", mp3: stream
    console.log(stream)
    
    @player.jPlayer
      ready: ->
        $(this).jPlayer "setMedia",
          mp3: stream
      stop: ->
        $(this).jPlayer "clearMedia"
      swfPath: "/js"
      supplied: "mp3"

    $("#track_title").text(source.title)
    
  confirmStreamButtonClicked: (stream) =>
    @refreshPlayer(stream)

  getLiveStream: =>

  login: (login, password) =>

  loginUnsuccessful: =>

  loginSuccessful: (user) =>
    