class @PodcastsUseCase
  constructor: ->
    @podcasts = []
    @episodes = {}

  getPodcasts: =>

  rcvdPodcasts: (@podcasts) =>

  addPodcast: (podcast) =>

  editPodcast: (podcast) =>

  deletePodcast: (podcast) =>

  getPodcastEpisodes: (podcast, from = 0, amount = 10) =>

  rcvdEpisodes: (podcast, episodes) =>
    @episodes[podcast.id] = episodes

  addPodcastEpisode: (episode) =>

  editPodcastEpisode: (episode) =>

  deletePodcastEpisode: (episode) =>