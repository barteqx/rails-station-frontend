(function() {

  this.Glue = (function() {

    function Glue(useCases, GUIs, server_side) {
      var _this = this;
      this.server_side = server_side;
      this.useCase = useCases[0], this.blogUseCase = useCases[1], this.podcastsUseCase = useCases[2], this.playlistUseCase = useCases[3];
      this.gui = GUIs[0], this.playlistGUI = GUIs[1], this.blogGUI = GUIs[2], this.podcastsGUI = GUIs[3];
      After(this.useCase, "start", function() {
        return _this.gui.refreshPlayer(_this.server_side.getStream());
      });
      After(this.gui, "loginUser", function(login, password) {
        return _this.useCase.loginUser(login, password);
      });
      After(this.useCase, "loginUser", function(login, password) {
        return _this.server_side.loginUser(login, password);
      });
      After(this.server_side, "loginSuccessful", function(user) {
        return _this.useCase.loginSuccessful(user);
      });
      After(this.useCase, "loginSuccessful", function(user) {
        return _this.gui.loginSuccessful(user);
      });
      After(this.gui, "logOut", function() {
        return _this.useCase.logOut();
      });
      After(this.useCase, "logOut", function() {
        return _this.server_side.logOut();
      });
      After(this.server_side, "showAlert", function(message) {
        return _this.gui.showAlert(message);
      });
      After(this.server_side, "showAlert", function(message) {
        return _this.gui.showAlert(message);
      });
      After(this.gui, "getLiveStream", function() {
        return _this.gui.refreshPlayer(_this.server_side.getStream());
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
