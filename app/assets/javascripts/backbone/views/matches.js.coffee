class Worldcup.Views.Matches extends Backbone.View
  tagname: 'div'

  template: HandlebarsTemplates['backbone/templates/matches']

  events:
    "click .nav li": "sortMatches"

  sortMatches: (e) ->
    e.preventDefault()
    t = $(e.currentTarget)
    t.siblings().removeClass('active')
    t.addClass('active')
    if t.text() is "Last 5 Matches"
      @filteredCollection = @collection.myFilter({group: "A"})
    if t.text() is "All Matches"
      @filteredCollection = null
    
    @render()
    

  initialize: ->

    @listenTo @collection, 'reset', @render
    if @collection.length is 0
      @nav = true
      @collection.fetch({reset: true}) 

  render: ->
    collection = if @filteredCollection then @filteredCollection else @collection
    @$el.html(@template(matches: collection.toJSON(), navigation: @nav))      
    @
    
  