(function() {

  this.BlogPost = (function() {

    function BlogPost(id, title, content, author, published) {
      this.id = id;
      this.title = title;
      this.content = content;
      this.author = author;
      this.published = published;
    }

    return BlogPost;

  })();

  this.PlaylistItem = (function() {

    function PlaylistItem(id, episode) {
      this.id = id;
      this.episode = episode;
    }

    return PlaylistItem;

  })();

  this.Podcast = (function() {

    function Podcast(id, title, description, author, episodeCount) {
      this.id = id;
      this.title = title;
      this.description = description;
      this.author = author;
      this.episodeCount = episodeCount;
    }

    return Podcast;

  })();

  this.User = (function() {

    function User(id, login) {
      this.id = id;
      this.login = login;
    }

    return User;

  })();

  this.PodcastEpisode = (function() {

    function PodcastEpisode(id, number, title, podcast, source) {
      this.id = id;
      this.number = number;
      this.title = title;
      this.podcast = podcast;
      this.source = source;
      this.type = "file";
    }

    return PodcastEpisode;

  })();

  this.Stream = (function() {

    function Stream(id, source, title) {
      this.id = id;
      this.source = source;
      this.title = title;
      this.type = "stream";
    }

    return Stream;

  })();

  this.Alert = (function() {

    function Alert(message) {
      this.message = message;
    }

    return Alert;

  })();

}).call(this);
