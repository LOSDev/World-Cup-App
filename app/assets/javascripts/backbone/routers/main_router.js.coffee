class Worldcup.Routers.MainRouter extends Backbone.Router

  
  routes:
    "": "index"
    "groups": "groups"

  groups: ->
    @layoutViews()
    @renderGroupsView()

  layoutViews: ->
    @appNav = new Worldcup.Views.AppNav()
    $('#header').html(@appNav.render().el)

  index: ->
    @layoutViews()

  renderGroupsView: ->
    v = new Worldcup.Views.Groups({collection: new Worldcup.Collections.Groups()})
    $('#content').html(v.render().el)
    