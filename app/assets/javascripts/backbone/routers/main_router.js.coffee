class Worldcup.Routers.MainRouter extends Backbone.Router
  routes:
    "": "index"

  index: ->

    @appNav = new Worldcup.Views.AppNav()
    
    $('#header').html(@appNav.render().el)