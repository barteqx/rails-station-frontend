class Gui
  constructor: ->

    @confirmStreamButton = $("#submit-stream-button")
    @confirmStreamButton.click( => @confirmStreamButtonClicked($("#stream").val()))
    $("#podcasts-playlist").sortable()
    $("#podcasts-playlist").selectable()
    $('#accordion').accordion()

  createElementFor: (templateId, data) =>
    source = $(templateId).html()
    template = Handlebars.compile(source)
    html = template(data)
    element = $(html)

  refreshPlayer: (stream) =>
    console.log(stream)
    $("#jquery_jplayer_1").jPlayer
      ready: ->
        $(this).jPlayer "setMedia",
          mp3: stream
      stop: ->
        $(this).jPlayer "clearMedia"
      swfPath: "/js"
      supplied: "mp3"
    
  confirmStreamButtonClicked: (stream) =>
    $("#jquery_jplayer_1").jPlayer "clearMedia"
    $("#jquery_jplayer_1").jPlayer "setMedia",
          mp3: stream
    @refreshPlayer(stream)
    