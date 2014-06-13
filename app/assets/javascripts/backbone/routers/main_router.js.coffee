class Worldcup.Routers.MainRouter extends Backbone.Router
  routes:
    "": "index"

  index: ->

    @headerView = new Worldcup.Views.Header()
    $('#header').html(@headerView.render().el)