class @PlaylistUseCase
  constructor: ->
    @loop = false
    @delete_after_listened = false
    @playlist =  {
      current: null,
      episodes: []
    }
    @playing = false

  addEpisode: (episode) =>
    @playlist.push(episode)

  getPlaylist: (@playlist) =>

  rcvdPlaylist: (@playlist) =>

  rearrange: (fromPos, toPos) =>
    elem = @playlist[fromPos]
    @playlist.removeAt(fromPos)
    @playlist.insert(elem, toPos)
    if @playlist.current < toPos and @playlist.current > fromPos
      @playlist.current -= 1

    else if @playlist.current >= toPos and @playlist.current < fromPos
      @playlist.current += 1

    else if @playlist.current == fromPos
      @playlist.current = toPos

  popEpisode: (i) =>
    @playlist.removeAt(i)
    if current == @playlist.length
      @playNext()

  deleteAfterListened: =>
    @popEpisode(@playlist.current) if @delete_after_listened

  toggleDeleteAfterListened: =>
    @loop = false if @loop else @loop
    @delete_after_listened = true if not @delete_after_listened else false

  toggleLoop: =>
    @delete_after_listened = false if @delete_after_listened else @delete_after_listened
    @loop = true if not @loop else false

  currentEpisode: =>
    @playlist[current]

  changeEpisode: (n) =>
    @playlist[current] = n % @playlist.episodes.length

  play: =>
    @playlist.current = 0 if @playlist.current == null else @playlist.current
    @playing = true

  pause: =>
    @playing = false

  stop: =>
    @playlist.current = null
    @playing = false

  playNext: =>
    if @loop
      @playlist.current = (@playlist.current + 1) % @playlist.length
    else
      @playlist.current = @playlist.current + 1 if @playlist.current < @playlist.length else null