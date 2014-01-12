(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.UseCase = (function() {

    function UseCase() {
      this.showAlert = __bind(this.showAlert, this);

      this.logOut = __bind(this.logOut, this);

      this.loginSuccesful = __bind(this.loginSuccesful, this);

      this.getInitialData = __bind(this.getInitialData, this);

      this.streamProvided = __bind(this.streamProvided, this);

      this.start = __bind(this.start, this);
      this.stream = null;
      this.playing_playlist = false;
    }

    UseCase.prototype.start = function() {
      return this.getInitialData();
    };

    UseCase.prototype.streamProvided = function(stream) {};

    UseCase.prototype.getInitialData = function() {};

    UseCase.prototype.loginSuccesful = function(user) {
      return this.user = user;
    };

    UseCase.prototype.logOut = function() {
      return this.user = null;
    };

    UseCase.prototype.showAlert = function(message) {};

    return UseCase;

  })();

}).call(this);
