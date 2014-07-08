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
    "matches/:id": "matches"
    "scorers": "scorers"

  homepage: ->
    
    Backbone.history.navigate "/groups/"


  scorers: ->
    v = new Worldcup.Views.Players({collection: new Worldcup.Collections.Players()})
    @childViews.push(v)
    @changeMainView(v)
    @changeActiveHeader(3)

  changeActiveHeader: (element) ->
    
    $('#header li').removeClass('active')
    selString = "#header li:eq(#{element})"
    $(selString).addClass('active')

  showGroup: (id) ->
    @renderGroupsView(id)
    @changeActiveHeader(1)

  groups: ->
    @renderGroupsView()
    @changeActiveHeader(1)

  layoutViews: ->
    

  index: ->

  renderGroupsView: (name="A")->
    v = new Worldcup.Views.Groups({collection: new Worldcup.Collections.Groups(), id: name})
    @childViews.push(v)
    @changeMainView(v)


  matches: (id = "recent-results")->
    @renderMatchesView(id)
    @changeActiveHeader(2)

  renderMatchesView: (id) ->
    v = new Worldcup.Views.Matches({collection: new Worldcup.Collections.Matches(), id: id})
    @childViews.push(v)
    @changeMainView(v)
    
  changeMainView: (v) ->
    
    @mainView.leave() if @mainView
    @mainView = v
    $('#content').html(v.el)
    v.render()
    


    