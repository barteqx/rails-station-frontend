(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.UseCase = (function() {

    function UseCase() {
      this.streamProvided = __bind(this.streamProvided, this);

      this.start = __bind(this.start, this);

    }

    UseCase.prototype.start = function() {};

    UseCase.prototype.streamProvided = function(stream) {};

    return UseCase;

  })();

}).call(this);
