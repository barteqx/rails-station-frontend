(function() {
  var Glue;

  Glue = (function() {

    function Glue(useCases, GUIs, server_side) {
      var _this = this;
      this.server_side = server_side;
      this.useCase = useCases[0], this.blogUseCase = useCases[1], this.podcastsUseCase = useCases[2], this.playlistUseCase = useCases[3];
      this.gui = GUIs[0], this.playlistGUI = GUIs[1], this.blogGUI = GUIs[2], this.podcastsGUI = GUIs[3];
      After(this.gui, "confirmStreamButtonClicked", function(stream) {
        return _this.useCase.streamProvided(stream);
      });
      After(this.useCase, "start", function() {
        return _this.gui.refreshPlayer(_this.server_side.getInitialStream());
      });
      After(this.gui, "getLiveStream", function() {
        return _this.gui.refreshPlayer(_this.server_side.getInitialStream());
      });
      LogAll(this.useCase);
      LogAll(this.gui);
      LogAll(this.podcastsGUI);
      LogAll(this.playlistGUI);
      LogAll(this.blogGUI);
    }

    return Glue;

  })();

}).call(this);
