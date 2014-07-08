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

    if t is "upcoming-matches"
      @nextMatches()

    if t is "round-of-16"       
      @roundOf16()
      
    if t is "quarter-finals"
      @quarterFinals()

    if t is "semi-finals"
      @semiFinals()
      
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

  addListener: (id) ->
    
    if id is "recent-results"
      @listenTo @collection, 'reset', @recentResults
    else if id is "upcoming-matches"
      @listenTo @collection, 'reset', @nextMatches
    else if id is "round-of-16"
      @listenTo @collection, 'reset', @roundOf16
    else if id is "quarter-finals"
      @listenTo @collection, 'reset', @quarterFinals
    else if id is "semi-finals"
      @listenTo @collection, 'reset', @semiFinals
    else
      @listenTo @collection, 'reset', ->
        @showTeam(id)


  initialize: ->
    @lastItem = null
    @listenTo @collection, 'reset', @render
    if @collection.length is 0
      @navView = new Worldcup.Views.MatchesNav(collection: new Worldcup.Collections.Groups())
      @addListener(@id)
     
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
    
  