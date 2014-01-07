(function() {
  var App, glue, server_side;

  App = (function() {
    var GUIs;

    function App() {
      var useCases;
      useCases = [new UseCase(), new BlogUseCase(), new PodcastsUseCase(), new PlaylistUseCase()];
    }

    GUIs = [new GUI(), new PlaylistGUI(), new BlogGUI(), new PodcastsGUI()];

    return App;

  })();

  server_side = new FakeServerSide();

  glue = new Glue(useCases, GUIs, server_side);

  useCases[0].start();

  window.useCase = useCases[0];

  $(document).ready(function() {
    new App();
    return $("a.jp-play").click(function() {
      return $("a.jp-pause").css("display", "block");
    });
  });

}).call(this);
