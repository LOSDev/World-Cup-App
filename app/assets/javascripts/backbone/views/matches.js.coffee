class Worldcup.Views.Matches extends Backbone.View
  tagname: 'div'

  template: HandlebarsTemplates['backbone/templates/matches']

  events:
    "click #matches-nav li": "sortMatches"

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
      @filteredCollection = @collection

    if t.text() is "Knockout Matches"
      @clickedItem = '#matches-nav li:eq(3)'
      collection = @collection.myFilter({match_type: "Second Round"})
      console.log collection
      @filteredCollection = collection
      

    if t.text() is "Today's Matches"
      @clickedItem = '#matches-nav li:eq(1)'      
      @filteredCollection = @collection.todaysMatches(new Date())

    v = new Worldcup.Views.MatchesViews({collection: @filteredCollection})
    @swapMatchesView(v)

  initialize: ->
    
    @listenTo @collection, 'reset', @render
    if @collection.length is 0
      @navView = new Worldcup.Views.MatchesNav()
      @clickedItem = '#matches-nav li:eq(0)'
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
    
  