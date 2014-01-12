(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.GUI = (function() {

    function GUI() {
      this.showAlert = __bind(this.showAlert, this);

      this.logOut = __bind(this.logOut, this);

      this.loginSuccessful = __bind(this.loginSuccessful, this);

      this.loginUser = __bind(this.loginUser, this);

      this.getLiveStream = __bind(this.getLiveStream, this);

      this.confirmStreamButtonClicked = __bind(this.confirmStreamButtonClicked, this);

      this.refreshPlayer = __bind(this.refreshPlayer, this);

      this.createElementFor = __bind(this.createElementFor, this);

      var _this = this;
      $("#podcasts-playlist").sortable();
      $("#podcasts-playlist").selectable();
      $('#play_livestream').click(function() {
        return _this.getLiveStream();
      });
      this.playerUI = $("#jp_container_1");
      this.player = $("#jquery_jplayer_1");
    }

    GUI.prototype.createElementFor = function(templateId, data) {
      var element, html, source, template;
      source = $(templateId).html();
      template = Handlebars.compile(source);
      html = template(data);
      return element = $(html);
    };

    GUI.prototype.refreshPlayer = function(source) {
      var stream;
      this.player.jPlayer("clearMedia");
      if (source.type === "stream") {
        this.playerUI.removeClass("jp-audio");
        this.playerUI.addClass("jp-audio-stream");
      } else {
        this.playerUI.removeClass("jp-audio-stream");
        this.playerUI.addClass("jp-audio");
      }
      stream = source.source;
      this.player.jPlayer("setMedia", {
        mp3: stream
      });
      console.log(stream);
      this.player.jPlayer({
        ready: function() {
          return $(this).jPlayer("setMedia", {
            mp3: stream
          });
        },
        stop: function() {
          return $(this).jPlayer("clearMedia");
        },
        swfPath: "/js",
        supplied: "mp3"
      });
      return $("#track_title").text(source.title);
    };

    GUI.prototype.confirmStreamButtonClicked = function(stream) {
      return this.refreshPlayer(stream);
    };

    GUI.prototype.getLiveStream = function() {};

    GUI.prototype.loginUser = function(login, password) {};

    GUI.prototype.loginSuccessful = function(user) {};

    GUI.prototype.logOut = function() {};

    GUI.prototype.showAlert = function(message) {
      return alert(message.message);
    };

    return GUI;

  })();

}).call(this);
