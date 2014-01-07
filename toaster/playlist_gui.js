(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.PlaylistGUI = (function() {

    function PlaylistGUI() {
      this.createElementFor = __bind(this.createElementFor, this);
      $("#playlist-options").buttonset();
    }

    PlaylistGUI.prototype.createElementFor = function(templateId, data) {
      var element, html, source, template;
      source = $(templateId).html();
      template = Handlebars.compile(source);
      html = template(data);
      return element = $(html);
    };

    return PlaylistGUI;

  })();

}).call(this);
