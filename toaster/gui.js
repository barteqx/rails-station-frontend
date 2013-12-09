(function() {
  var Gui,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Gui = (function() {

    function Gui() {
      this.hideStream = __bind(this.hideStream, this);

      this.restartClicked = __bind(this.restartClicked, this);

      this.showStream = __bind(this.showStream, this);

      this.hideAskForStream = __bind(this.hideAskForStream, this);

      this.confirmStreamButtonClicked = __bind(this.confirmStreamButtonClicked, this);

      this.showAskForStream = __bind(this.showAskForStream, this);

      this.createElementFor = __bind(this.createElementFor, this);

    }

    Gui.prototype.createElementFor = function(templateId, data) {
      var element, html, source, template;
      source = $(templateId).html();
      template = Handlebars.compile(source);
      html = template(data);
      return element = $(html);
    };

    Gui.prototype.showAskForStream = function() {
      var confirmStreamButton, element,
        _this = this;
      element = this.createElementFor("#ask-for-stream-template");
      $(".main").append(element);
      confirmStreamButton = $("#submit-stream-button");
      confirmStreamButton.click(function() {
        return _this.confirmStreamButtonClicked($("#stream").val());
      });
      return $("#stream").focus();
    };

    Gui.prototype.confirmStreamButtonClicked = function(stream) {};

    Gui.prototype.hideAskForStream = function() {
      return $(".ask-for-stream").remove();
    };

    Gui.prototype.showStream = function(stream) {
      var element,
        _this = this;
      element = this.createElementFor("#stream-playing-template", {
        stream: stream
      });
      $("#stream-player").jPlayer({
        ready: function(event) {
          return $(this).jPlayer("setMedia", {
            mp3: "http://jplayer.org/audio/mp3/TSP-01-Cro_magnon_man.mp3"
          });
        },
        preload: "auto",
        swfPath: "/",
        solution: "html, flash",
        supplied: 'mp3'
      });
      $(".main").append(element);
      return $("#restart-link").click(function() {
        return _this.restartClicked();
      });
    };

    Gui.prototype.restartClicked = function() {};

    Gui.prototype.hideStream = function() {
      return $(".greet-message").remove();
    };

    return Gui;

  })();

}).call(this);
