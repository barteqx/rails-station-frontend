(function() {
  var App, glue, server_side;

  App = (function() {
    var GUIs;

    function App() {
      var useCases;
      useCases = [new UseCase(), new BlogUseCase(), new PodcastsUseCase(), new PlaylistUseCase()];
    }

    GUIs = [new Gui(), new PlaylistGUI(), new BlogGUI(), new PodcastsGUI()];

    return App;

  })();

  server_side = new FakeServerSide();

  glue = new Glue(useCases, GUIs, server_side);

  useCases[0].start();

  window.useCase = useCase;

  $(document).ready(function() {
    new App();
    return $("a.jp-play").click(function() {
      return $("a.jp-pause").css("display", "block");
    });
  });

}).call(this);
