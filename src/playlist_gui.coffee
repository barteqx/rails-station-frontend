class @PlaylistGUI
  constructor: ->

    $("#playlist-options").buttonset()

  createElementFor: (templateId, data) =>
    source = $(templateId).html()
    template = Handlebars.compile(source)
    html = template(data)
    element = $(html)