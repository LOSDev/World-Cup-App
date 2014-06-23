class Worldcup.Views.Matches extends Backbone.View
  tagname: 'div'

  template: HandlebarsTemplates['backbone/templates/matches']

  events:
    "click .nav li": "sortMatches"

  sortMatches: (e) ->
    e.preventDefault()
    t = @$(e.currentTarget)
    
    if t.text() is "Recent Results"
      @clickedItem = '#matches-nav li:eq(2)'
      collection = @collection.recentMatches(new Date()).last(8).reverse()
      @filteredCollection = new Worldcup.Collections.Matches()
      @filteredCollection.add(collection)
      
    if t.text() is "All Matches"
      @clickedItem = '#matches-nav li:eq(0)'
      @filteredCollection = null

    if t.text() is "Today's Matches"
      @clickedItem = '#matches-nav li:eq(1)'      
      @filteredCollection = @collection.todaysMatches(new Date())
      
    @render()

  initialize: ->
    
    @listenTo Worldcup.Vent, "matches:recent", @sortMatches
    @listenTo @collection, 'reset', @render
    if @collection.length is 0
      @navView = new Worldcup.Views.MatchesNav()
      @clickedItem = '#matches-nav li:eq(0)'
      @collection.fetch({reset: true}) 

  render: ->
    collection = if @filteredCollection then @filteredCollection else @collection
    @$el.html(@template(matches: collection.toJSON()))
    @$('#matches-nav').html(@navView.render().el) if @navView
    @$(@clickedItem).addClass('active') if @clickedItem
    @
    
  