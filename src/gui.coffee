#<< playlist_gui
#<< blog_gui
#<< podcasts_gui

class Gui
  constructor: ->

    @playlistGUI = new PlaylistGUI(@)
    @blogGUI = new BlogGUI(@)
    @podcastsGUI = new PodcastsGUI(@)

    @confirmStreamButton = $("#submit-stream-button")
    @confirmStreamButton.click( => @confirmStreamButtonClicked(new Stream(1,$("#stream").val(), "Test")))
    $("#podcasts-playlist").sortable()
    $("#podcasts-playlist").selectable()
    @player = $("#jp_container_1")

  createElementFor: (templateId, data) =>
    source = $(templateId).html()
    template = Handlebars.compile(source)
    html = template(data)
    element = $(html)

  refreshPlayer: (source) =>

    if (source.type == "stream")
      @player.removeClass("jp-audio")
      @player.addClass("jp-audio-stream")

    else 
      @player.removeClass("jp-audio-stream")
      @player.addClass("jp-audio")

    stream = source.source

    console.log(stream)
    $("#jquery_jplayer_1").jPlayer
      ready: ->
        $(this).jPlayer "setMedia",
          mp3: stream
      stop: ->
        $(this).jPlayer "clearMedia"
      swfPath: "/js"
      supplied: "mp3"

    $("#track_title").text(source.title)
    
  confirmStreamButtonClicked: (stream) =>
    $("#jquery_jplayer_1").jPlayer "clearMedia"
    @refreshPlayer(stream)
    