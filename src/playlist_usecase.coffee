class @PlaylistUseCase
  constructor: ->
    @loop = false
    @delete_after_listened = false
    @playlist = []
    @current = null
    @playing = false

  addEpisode: (episode) =>
    @playlist.push(episode)

  rearrange: (fromPos, toPos) =>
    elem = @playlist[fromPos]
    @playlist.removeAt(fromPos)
    @playlist.insert(elem, toPos)
    if @current < toPos and @current > fromPos
      @current -= 1

    else if @current >= toPos and @current < fromPos
      @current += 1

    else if @current == fromPos
      @current = toPos

  popEpisode: (i) =>
    @playlist.removeAt(i)
    if current == @playlist.length
      @playNext()

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

  play: =>
    @playing = true if @current != null

  pause: =>
    @playing = false

  stop: =>
    @current = null
    @playing = false

  playNext: =>
    if @loop
      @current = (@current + 1) % @playlist.length
    else
      @current = @current + 1 if @current < @playlist.length else null