(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.BlogGUI = (function() {

    function BlogGUI() {
      this.showPost = __bind(this.showPost, this);

      this.listPosts = __bind(this.listPosts, this);

      this.deletePost = __bind(this.deletePost, this);

      this.savePost = __bind(this.savePost, this);

      this.editPost = __bind(this.editPost, this);

      this.newPost = __bind(this.newPost, this);

      this.getPost = __bind(this.getPost, this);

      this.getPosts = __bind(this.getPosts, this);

      this.createElementFor = __bind(this.createElementFor, this);
      this.getPosts(0, 4);
    }

    BlogGUI.prototype.createElementFor = function(templateId, data) {
      var element, html, source, template;
      source = $(templateId).html();
      template = Handlebars.compile(source);
      html = template(data);
      return element = $(html);
    };

    BlogGUI.prototype.getPosts = function(fromNumber, quantity) {};

    BlogGUI.prototype.getPost = function(post_id) {};

    BlogGUI.prototype.newPost = function() {};

    BlogGUI.prototype.editPost = function(post_id) {};

    BlogGUI.prototype.savePost = function(title, content, user, id) {
      if (id == null) {
        id = null;
      }
    };

    BlogGUI.prototype.deletePost = function(post_id) {};

    BlogGUI.prototype.listPosts = function(posts) {};

    BlogGUI.prototype.showPost = function(post) {};

    return BlogGUI;

  })();

}).call(this);
