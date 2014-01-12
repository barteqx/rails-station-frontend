class @PlaylistUseCase
  constructor: ->
    @loop = false
    @delete_after_listened = false
    @playlist = []
    @current = null

  addEpisode: (episode) =>
    @playlist.push(episode)

  rearrange: (fromPos, toPos) =>
    elem = @playlist[fromPos]
    @playlist.removeAt(fromPos)
    @playlist.insert(elem, toPos)

  popEpisode: (i) =>
    @playlist.removeAt(i)

  deleteAfterListened: =>
    @popEpisode(@current) if @delete_after_listened

  toggleDeleteAfterListened: =>
    @loop = false if @loop else @loop
    @delete_after_listened = true if not @delete_after_listened else false

  toggleLoop: =>
    @delete_after_listened = false if @delete_after_listened else @delete_after_listened
    @loop = true if not @loop else false

  currentEpisode: =>
    @playlist[current]