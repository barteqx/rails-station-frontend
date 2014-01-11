class @BlogPost
  constructor: (@id, @title, @content, @author, @published) ->

class @PlaylistItem
  constructor: (@id, @episode) ->

class @Podcast
  constructor: (@id, @title, @description, @author, @episodeCount) ->

class @User
  constructor: (@id, @login) ->

class @PodcastEpisode
  constructor: (@id, @number, @title, @podcast, @source) ->
    @type = "file"

class @Stream
  constructor: (@id, @source, @title) ->
    @type = "stream"