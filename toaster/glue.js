(function() {
  var Glue;

  Glue = (function() {

    function Glue(useCase, gui) {
      var _this = this;
      this.useCase = useCase;
      this.gui = gui;
      After(this.useCase, "askForStream", function() {
        return _this.gui.showAskForStream();
      });
      After(this.useCase, "streamProvided", function() {
        return _this.gui.hideAskForStream();
      });
      After(this.useCase, "showStream", function(stream) {
        return _this.gui.showStream(stream);
      });
      After(this.useCase, "restart", function() {
        return _this.gui.hideStream();
      });
      After(this.gui, "restartClicked", function() {
        return _this.useCase.restart();
      });
      After(this.gui, "confirmStreamButtonClicked", function(stream) {
        return _this.useCase.streamProvided(stream);
      });
      LogAll(this.useCase);
      LogAll(this.gui);
    }

    return Glue;

  })();

}).call(this);
