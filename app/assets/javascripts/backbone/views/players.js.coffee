class Worldcup.Views.Players extends Backbone.View
  tagname: 'div'
  
  template: HandlebarsTemplates['backbone/templates/players']

  initialize: ->
    @listenTo @collection, 'sort', @render
    @listenTo @collection, 'reset', @render
    @collection.fetch({reset: true})
    
  events:
    "click th a" : "sortClick"
    "click .pagination li a" : "showPage"

  showPage: (e) ->
    e.preventDefault()
    t = e.currentTarget
    number = parseInt(t.text)
    if _.isNumber(number)
      filteredCollection = @collection.switchPage(number)
    if t.text is "Next"
      filteredCollection = @collection.nextPage()
    if t.text is "Previous"
      filteredCollection = @collection.previousPage()
    
    @render()

  sortClick: (e) ->
    e.preventDefault()
    column = $(e.currentTarget).text().toLowerCase()
    @collection.sortPlayers(column)
    
    
  render: ->
    filteredCollection = @collection.showPage()
    #console.log filteredCollection
    @$el.html(@template(players: filteredCollection.toJSON())) 
    @renderPagination(@collection)    
    @

  renderPagination: (collection) ->
    v = new Worldcup.Views.Pagination({collection: @collection})
    @$el.append(v.render().el)
  