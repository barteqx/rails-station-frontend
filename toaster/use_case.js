(function() {
  var UseCase,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  UseCase = (function() {

    function UseCase() {
      this.restart = __bind(this.restart, this);

      this.showStream = __bind(this.showStream, this);

      this.streamProvided = __bind(this.streamProvided, this);

      this.askForStream = __bind(this.askForStream, this);

      this.start = __bind(this.start, this);

    }

    UseCase.prototype.start = function() {
      return this.askForStream();
    };

    UseCase.prototype.askForStream = function() {};

    UseCase.prototype.streamProvided = function(stream) {
      return this.showStream(stream);
    };

    UseCase.prototype.showStream = function(stream) {};

    UseCase.prototype.restart = function() {
      return this.askForStream();
    };

    return UseCase;

  })();

}).call(this);
