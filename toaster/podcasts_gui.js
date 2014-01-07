(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.PodcastsGUI = (function() {

    function PodcastsGUI() {
      this.createElementFor = __bind(this.createElementFor, this);

    }

    PodcastsGUI.prototype.createElementFor = function(templateId, data) {
      var element, html, source, template;
      source = $(templateId).html();
      template = Handlebars.compile(source);
      html = template(data);
      return element = $(html);
    };

    return PodcastsGUI;

  })();

}).call(this);
