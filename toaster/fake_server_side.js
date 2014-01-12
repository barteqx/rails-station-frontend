(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.FakeServerSide = (function() {

    function FakeServerSide() {
      this.showAlert = __bind(this.showAlert, this);

      this.logOut = __bind(this.logOut, this);

      this.loginUnsuccessful = __bind(this.loginUnsuccessful, this);

      this.loginSuccesful = __bind(this.loginSuccesful, this);

      this.loginUser = __bind(this.loginUser, this);

      this.rcvdPlaylist = __bind(this.rcvdPlaylist, this);

      this.getPlaylist = __bind(this.getPlaylist, this);

      this.addUser = __bind(this.addUser, this);

      this.deleteUser = __bind(this.deleteUser, this);

      this.alterUser = __bind(this.alterUser, this);

      this.rcvdUsers = __bind(this.rcvdUsers, this);

      this.getUsers = __bind(this.getUsers, this);

      this.deletePodcastEpisodes = __bind(this.deletePodcastEpisodes, this);

      this.rcvdPodcastEpisodes = __bind(this.rcvdPodcastEpisodes, this);

      this.getPodcastEpisodes = __bind(this.getPodcastEpisodes, this);

      this.deletePodcast = __bind(this.deletePodcast, this);

      this.rcvdPodcast = __bind(this.rcvdPodcast, this);

      this.getPodcasts = __bind(this.getPodcasts, this);

      this.deletePost = __bind(this.deletePost, this);

      this.sendPost = __bind(this.sendPost, this);

      this.rcvdPosts = __bind(this.rcvdPosts, this);

      this.getPosts = __bind(this.getPosts, this);

      this.checkAutoPlay = __bind(this.checkAutoPlay, this);

      this.getStream = __bind(this.getStream, this);

      var user;
      this.user = null;
      this.users = [];
      user = new User(1, "tester");
      this.posts = [];
      this.podcasts = [];
      this.playlist = [];
      this.episodes = {};
    }

    FakeServerSide.prototype.getStream = function() {
      return new Stream(0, "http://188.40.32.140:8172/stream", "Kontestacja");
    };

    FakeServerSide.prototype.checkAutoPlay = function() {
      return true;
    };

    FakeServerSide.prototype.getPosts = function(fromNumber, amount) {
      if (fromNumber == null) {
        fromNumber = 0;
      }
      if (amount == null) {
        amount = 4;
      }
      return this.rcvdPosts(this.posts);
    };

    FakeServerSide.prototype.rcvdPosts = function(posts) {};

    FakeServerSide.prototype.sendPost = function(post) {
      return this.posts.shift(post);
    };

    FakeServerSide.prototype.deletePost = function(post) {};

    FakeServerSide.prototype.getPodcasts = function() {
      return rcvdPodcast(this.podcasts);
    };

    FakeServerSide.prototype.rcvdPodcast = function(podcasts) {};

    FakeServerSide.prototype.deletePodcast = function(podcast) {};

    FakeServerSide.prototype.getPodcastEpisodes = function(podcast, fromNumber, amount) {
      if (fromNumber == null) {
        fromNumber = 0;
      }
      if (amount == null) {
        amount = 10;
      }
      return rcvdPodcastEpisodes(episodes[podcast.id]);
    };

    FakeServerSide.prototype.rcvdPodcastEpisodes = function(episodes) {};

    FakeServerSide.prototype.deletePodcastEpisodes = function(episodes) {};

    FakeServerSide.prototype.getUsers = function() {
      return rcvdUsers(this.users);
    };

    FakeServerSide.prototype.rcvdUsers = function(users) {};

    FakeServerSide.prototype.alterUser = function(user, operation) {};

    FakeServerSide.prototype.deleteUser = function(user) {};

    FakeServerSide.prototype.addUser = function(nick, password, email) {};

    FakeServerSide.prototype.getPlaylist = function() {};

    FakeServerSide.prototype.rcvdPlaylist = function(playlist) {};

    FakeServerSide.prototype.loginUser = function(login, password) {
      if (login === "xyz" && password === "abc") {
        return this.loginSuccesful(new User(1, "xyz"));
      } else {
        return this.loginUnsuccessful("Authentication failed - try again.");
      }
    };

    FakeServerSide.prototype.loginSuccesful = function(user) {
      return this.user = user;
    };

    FakeServerSide.prototype.loginUnsuccessful = function(message) {
      return this.showAlert(Alert(message));
    };

    FakeServerSide.prototype.logOut = function() {
      return this.user = null;
    };

    FakeServerSide.prototype.showAlert = function(message) {};

    return FakeServerSide;

  })();

}).call(this);
