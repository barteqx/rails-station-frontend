(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.FakeServerSide = (function() {

    function FakeServerSide() {
      this.loginUnsuccessful = __bind(this.loginUnsuccessful, this);

      this.loginSuccesful = __bind(this.loginSuccesful, this);

      this.loginUser = __bind(this.loginUser, this);

      this.getPosts = __bind(this.getPosts, this);

      this.checkAutoPlay = __bind(this.checkAutoPlay, this);

      this.getInitialStream = __bind(this.getInitialStream, this);

    }

    FakeServerSide.prototype.getInitialStream = function() {
      return new Stream(0, "http://188.40.32.140:8172/stream", "Kontestacja");
    };

    FakeServerSide.prototype.checkAutoPlay = function() {
      return true;
    };

    FakeServerSide.prototype.getPosts = function(fromNumber, amount) {
      var user;
      if (fromNumber == null) {
        fromNumber = 0;
      }
      if (amount == null) {
        amount = 4;
      }
      user = new User(1, "tester");
      return [new BlogPost(1, "Test fake post", "<b>Fake post no. 1.</b>", user), new BlogPost(2, "Test fake post", "<b>Fake post no. 2.</b>", user), new BlogPost(2, "Test fake post", "<b>Fake post no. 3.</b>", user), new BlogPost(2, "Test fake post", "<b>Fake post no. 4.</b>", user)];
    };

    FakeServerSide.prototype.loginUser = function(login, password) {
      if (login === "xyz" && password === "abc") {
        return this.loginSuccesful(new User(1, "xyz"));
      } else {
        return this.loginUnsuccessful();
      }
    };

    FakeServerSide.prototype.loginSuccesful = function(user) {};

    FakeServerSide.prototype.loginUnsuccessful = function() {};

    return FakeServerSide;

  })();

}).call(this);
