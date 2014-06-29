class Worldcup.Views.Matches extends Backbone.View
  tagname: 'div'

  template: HandlebarsTemplates['backbone/templates/matches']

  events:
    "change #team-select": "showTeam"
    "click .match-nav-item": "sortMatches"

  showTeam: (e) ->
    e.preventDefault()
    @clickedItem = null
    value = @$(e.currentTarget).val()   
    @filteredCollection = @collection.teamMatches(value)    
    @createNewView()

  sortMatches: (e) ->
    e.preventDefault()
    t = @$(e.currentTarget).text()
    
    if t is "Recent Results"
      @clickedItem = '.match-nav-item:eq(0)'
      @recentResults()

    if t is "Upcoming Matches"
      @clickedItem = '.match-nav-item:eq(1)' 
      @nextMatches()

    if t is "Round of 16" 
      @clickedItem = '.match-nav-item:eq(2)'
      @knockoutMatches(t)
      
    if t is "Quarter Finals"
      @clickedItem = '.match-nav-item:eq(3)'
      @knockoutMatches("Quarter Final")
      

  recentResults: ->
    
    @filteredCollection = @collection.recentMatches(new Date()) if @collection
    @createNewView()

  nextMatches: ->
    @filteredCollection = @collection.nextMatches(new Date())
    @createNewView()

  todaysMatches: ->
         
    @filteredCollection = @collection.todaysMatches(new Date())
    @createNewView()

  knockoutMatches: (round) ->
    @filteredCollection = @collection.knockoutMatches(round)    
    @createNewView()

  createNewView: ->
    v = new Worldcup.Views.MatchesViews({collection: @filteredCollection})
    @swapMatchesView(v)

  initialize: ->
    
    @listenTo @collection, 'reset', @render
    if @collection.length is 0
      @navView = new Worldcup.Views.MatchesNav(collection: new Worldcup.Collections.Groups())
      @clickedItem = '.match-nav-item:eq(0)'
      @collection.fetch({reset: true}) 

  render: ->
    @$el.html(@template())
    @$('#matches-nav').html(@navView.render().el) if @navView
    @recentResults()
    @

  swapMatchesView: (v) ->
    @changeCurrentMatchesView(v)
    @$('.match-nav-item').removeClass('active')

    @$(@clickedItem).addClass('active') if @clickedItem
    @$('#matches-views').html(@currentMatchesView.render().el)

  changeCurrentMatchesView: (v) ->
    @currentMatchesView.leave() if @currentMatchesView
    @currentMatchesView = v
    
  