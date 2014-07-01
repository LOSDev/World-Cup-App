class Worldcup.Views.Matches extends Backbone.View
  tagname: 'div'

  template: HandlebarsTemplates['backbone/templates/matches']

  events:
    "change #team-select": "showTeam"
    "click .match-nav-item": "sortMatches"
    "click .match-view": "showMatchDetails"

  showMatchDetails: (e) ->
    e.preventDefault()
    t = $(e.currentTarget)
    id = t.data("id")
    model = @collection.get(id)
    v = new Worldcup.Views.MatchDetails({model: model})
    t.siblings('.match-details').html(v.render().el)

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
    @render()

  nextMatches: ->
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
    
    @listenTo @collection, 'reset', @render
    @listenTo @collection, 'reset', @recentResults
    if @collection.length is 0
      @navView = new Worldcup.Views.MatchesNav(collection: new Worldcup.Collections.Groups())
      @clickedItem = '.match-nav-item:eq(0)'
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
    @$('.match-nav-item').removeClass('active')

    @$(@clickedItem).addClass('active') if @clickedItem
    @$('#matches-views').html(@currentMatchesView.render().el)

  changeCurrentMatchesView: (v) ->
    @currentMatchesView.leave() if @currentMatchesView
    @currentMatchesView = v
    
  