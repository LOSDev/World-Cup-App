class Worldcup.Routers.MainRouter extends Backbone.Router
  initialize: ->
    @listenTo @listenTo Worldcup.Vent, "groups:show", @groups
    @listenTo @listenTo Worldcup.Vent, "matches:show", @matches
    @listenTo @listenTo Worldcup.Vent, "scorers:show", @matches

  routes:
    "": "groups"
    "groups": "groups"
    "groups/:id": "showGroup"
    "matches": "matches"

  showGroup: (id) ->
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
    
    
    