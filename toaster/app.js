(function() {
  var App;

  App = (function() {

    function App() {
      var glue, gui, useCase;
      useCase = new UseCase();
      gui = new Gui();
      glue = new Glue(useCase, gui);
      useCase.start();
      window.useCase = useCase;
    }

    return App;

  })();

  $(document).ready(function() {
    return new App();
  });

}).call(this);
