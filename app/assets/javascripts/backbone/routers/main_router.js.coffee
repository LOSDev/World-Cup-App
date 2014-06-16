class Worldcup.Routers.MainRouter extends Backbone.Router

  
  routes:
    "": "index"
    "groups": "groups"
    "groups/:id": "showProject"
    "matches": "matches"

  showProject: (id) ->
    @layoutViews()
    @renderGroupsView(id)
    


  groups: ->
    @layoutViews()
    @renderGroupsView()

  layoutViews: ->
    @appNav = new Worldcup.Views.AppNav()
    $('#header').html(@appNav.render().el)

  index: ->
    @layoutViews()

  renderGroupsView: (name="A")->
    v = new Worldcup.Views.Groups({collection: new Worldcup.Collections.Groups(), id: name})
    $('#content').html(v.render().el)

  matches: ->
    @layoutViews()
    @renderMatchesView()

  renderMatchesView: ->
    v = new Worldcup.Views.Matches({collection: new Worldcup.Collections.Matches()})
    $('#content').html(v.render().el)
    
    
    