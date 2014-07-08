class Worldcup.Views.Matches extends Backbone.View
  tagname: 'div'

  template: HandlebarsTemplates['backbone/templates/matches']

  events:
    "change #team-select": "teamClick"
    "click .match-nav-item": "sortClick"
    "click .match-view": "showMatchDetails"

  showMatchDetails: (e) ->
    e.preventDefault()
    t = $(e.currentTarget)
    id = t.data("id")
    model = @collection.get(id)
    v = new Worldcup.Views.MatchDetails({model: model})
    $('.match-details').html("")
    if id isnt @lastItem
      t.children().children('.match-details').html(v.render().el) 
      @lastItem = id
    else
      @lastItem = null    

  showTeam: (value) ->
    Backbone.history.navigate("/matches/" + value)
    $("#team-select option[value=\"#{value}\"]").attr("selected", "selected")
    @filteredCollection = @collection.teamMatches(value)    
    @createNewView()

  teamClick: (e) ->
    e.preventDefault()
    @clickedItem = null
    value = @$(e.currentTarget).val()
    @showTeam(value)

  sortClick: (e) ->
    e.preventDefault()
    t = @$(e.currentTarget).text().toLowerCase().replace(/\s+/g, '-')
    Backbone.history.navigate("/matches/" + t)
    @sortMatches(t)
    
  sortMatches: (t) ->
    if t is "recent-results"      
      @recentResults()
    else if t is "upcoming-matches"
      @nextMatches()
    else if t is "round-of-16"       
      @roundOf16()      
    else if t is "quarter-finals"
      @quarterFinals()
    else if t is "semi-finals"
      @semiFinals()
    else if t is "finals"
      @finals()
    else
      @showTeam(t)
    
  roundOf16: ->
    @clickedItem = '.match-nav-item:eq(1)'
    @filteredCollection = @collection.knockoutMatches("Round of 16")
    @render()

  quarterFinals: ->
    @clickedItem = '.match-nav-item:eq(2)'
    @filteredCollection = @collection.knockoutMatches("Quarter Final")   
    @render()

  semiFinals: ->
    @clickedItem = '.match-nav-item:eq(3)'
    @filteredCollection = @collection.knockoutMatches("Semi Final")   
    @render()

  finals: ->
    @clickedItem = '.match-nav-item:eq(4)'
    @filteredCollection = @collection.knockoutMatches("Final")  
    c2 = @collection.knockoutMatches("3rd Place")
    @filteredCollection.add(c2.models) 
    @render()

  recentResults: ->
    @clickedItem = '.match-nav-item:eq(0)'
    @filteredCollection = @collection.recentMatches(new Date()) if @collection
    @render()

  nextMatches: ->
    @clickedItem = '.match-nav-item:eq(1)'
    @filteredCollection = @collection.nextMatches(new Date())
    @render()

  todaysMatches: ->         
    @filteredCollection = @collection.todaysMatches(new Date())
    @render()

  knockoutMatches: (round) ->    
    @filteredCollection = @collection.knockoutMatches(round)    
    @render()

  createNewView: ->
    v = new Worldcup.Views.MatchesViews({collection: @filteredCollection})
    @swapMatchesView(v)

  initialize: ->
    @lastItem = null
    @listenTo @collection, 'reset', @render
    #collection needs to be fetched and needs a nav if it is empty
    if @collection.length is 0
      @navView = new Worldcup.Views.MatchesNav(collection: new Worldcup.Collections.Groups())
      
      @listenTo @collection, 'reset', ->
        @sortMatches(@id)
      @collection.fetch({reset: true})
    else 
      @filteredCollection = @collection

  render: ->
    @$el.html(@template())
    @$('#matches-nav').html(@navView.render().el) if @navView
    @createNewView() if @filteredCollection
    @

  swapMatchesView: (v) ->
    @changeCurrentMatchesView(v)
    Worldcup.Vent.trigger "set:matchTab", @clickedItem
    @$('#matches-views').html(@currentMatchesView.render().el)

  changeCurrentMatchesView: (v) ->
    @currentMatchesView.leave() if @currentMatchesView
    @currentMatchesView = v
    
  