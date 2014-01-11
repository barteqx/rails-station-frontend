(function() {
  var App;

  App = (function() {

    function App() {
      var glue, guis, server_side, use_cases;
      use_cases = [new UseCase(), new BlogUseCase(), new PodcastsUseCase(), new PlaylistUseCase()];
      guis = [new GUI(), new PlaylistGUI(), new BlogGUI(), new PodcastsGUI()];
      server_side = new FakeServerSide();
      glue = new Glue(use_cases, guis, server_side);
      use_cases[0].start();
      window.useCase = use_cases[0];
    }

    return App;

  })();

  $(document).ready(function() {
    new App();
    return $("a.jp-play").click(function() {
      return $("a.jp-pause").css("display", "block");
    });
  });

}).call(this);
