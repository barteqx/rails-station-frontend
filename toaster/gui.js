(function() {
  var Gui,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Gui = (function() {

    function Gui() {
      this.loginSuccessful = __bind(this.loginSuccessful, this);

      this.loginUnsuccessful = __bind(this.loginUnsuccessful, this);

      this.login = __bind(this.login, this);

      this.getLiveStream = __bind(this.getLiveStream, this);

      this.confirmStreamButtonClicked = __bind(this.confirmStreamButtonClicked, this);

      this.refreshPlayer = __bind(this.refreshPlayer, this);

      this.createElementFor = __bind(this.createElementFor, this);

      var _this = this;
      this.confirmStreamButton = $("#submit-stream-button");
      this.confirmStreamButton.click(function() {
        return _this.confirmStreamButtonClicked(new Stream(1, $("#stream").val(), "Test"));
      });
      $("#podcasts-playlist").sortable();
      $("#podcasts-playlist").selectable();
      $('#play_livestream').click(function() {
        return _this.getLiveStream();
      });
      this.playerUI = $("#jp_container_1");
      this.player = $("#jquery_jplayer_1");
    }

    Gui.prototype.createElementFor = function(templateId, data) {
      var element, html, source, template;
      source = $(templateId).html();
      template = Handlebars.compile(source);
      html = template(data);
      return element = $(html);
    };

    Gui.prototype.refreshPlayer = function(source) {
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

    Gui.prototype.confirmStreamButtonClicked = function(stream) {
      return this.refreshPlayer(stream);
    };

    Gui.prototype.getLiveStream = function() {};

    Gui.prototype.login = function(login, password) {};

    Gui.prototype.loginUnsuccessful = function() {};

    Gui.prototype.loginSuccessful = function(user) {};

    return Gui;

  })();

}).call(this);
