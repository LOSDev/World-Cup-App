class Worldcup.Views.Matches extends Backbone.View
  tagname: 'div'

  template: HandlebarsTemplates['backbone/templates/matches']

  events:
    "change #team-select": "showTeam"
    "click .match-nav-item": "sortMatches"

  showTeam: (e) ->
    e.preventDefault()
    value = @$(e.currentTarget).val()
   
    @filteredCollection = @collection.teamMatches(value)
    
    v = new Worldcup.Views.MatchesViews({collection: @filteredCollection})
    @swapMatchesView(v)

  sortMatches: (e) ->
    e.preventDefault()
    t = @$(e.currentTarget)
    
    if t.text() is "Recent Results"
      @clickedItem = '.match-nav-item:eq(2)'
      collection = @collection.recentMatches(new Date()).last(8).reverse()
      @filteredCollection = new Worldcup.Collections.Matches()
      @filteredCollection.add(collection)
      
    if t.text() is "All Matches"
      @clickedItem = '.match-nav-item:eq(0)'
      @filteredCollection = @collection

    if t.text() is "Knockout Matches"
      @clickedItem = '.match-nav-item:eq(3)'
      collection = @collection.knockoutMatches()
      @filteredCollection = collection
      

    if t.text() is "Today's Matches"
      @clickedItem = '.match-nav-item:eq(1)'      
      @filteredCollection = @collection.todaysMatches(new Date())
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
    v = new Worldcup.Views.MatchesViews({collection: @collection})
    @swapMatchesView(v)
    @

  swapMatchesView: (v) ->
    @changeCurrentMatchesView(v)
    @$('#matches-nav li').removeClass('active')
    @$(@clickedItem).addClass('active') if @clickedItem
    @$('#matches-views').html(@currentMatchesView.render().el)

  changeCurrentMatchesView: (v) ->
    @currentMatchesView.leave() if @currentMatchesView
    @currentMatchesView = v
    
  