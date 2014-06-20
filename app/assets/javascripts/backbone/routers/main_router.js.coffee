class Worldcup.Routers.MainRouter extends Backbone.Router
  initialize: ->
    @childViews =[]
    @listenTo @listenTo Worldcup.Vent, "groups:show", @groups
    @listenTo @listenTo Worldcup.Vent, "matches:show", @matches
    @listenTo @listenTo Worldcup.Vent, "scorers:show", @scorers

    @appNav = new Worldcup.Views.AppNav()
    $('#header').html(@appNav.render().el)

  routes:
    "": "groups"
    "groups": "groups"
    "groups/:id": "showGroup"
    "matches": "matches"
    "scorers": "scorers"

  scorers: ->
    v = new Worldcup.Views.Players({collection: new Worldcup.Collections.Players()})
    @childViews.push(v)
    @changeMainView(v)

  showGroup: (id) ->
    @renderGroupsView(id)
    

  groups: ->
    @renderGroupsView()

  layoutViews: ->
    

  index: ->

  renderGroupsView: (name="A")->
    v = new Worldcup.Views.Groups({collection: new Worldcup.Collections.Groups(), id: name})
    @childViews.push(v)
    @changeMainView(v)

  matches: ->
    @renderMatchesView()

  renderMatchesView: ->
    v = new Worldcup.Views.Matches({collection: new Worldcup.Collections.Matches()})
    @childViews.push(v)
    @changeMainView(v)
    
  changeMainView: (v) ->
    @mainView.leave() if @mainView
    @mainView = v
    $('#content').html(v.render().el)

    