class PlaylistGUI
  constructor: (@mainGUI) ->

    $("#playlist-options").buttonset()

  createElementFor: (templateId, data) =>
    source = $(templateId).html()
    template = Handlebars.compile(source)
    html = template(data)
    element = $(html)