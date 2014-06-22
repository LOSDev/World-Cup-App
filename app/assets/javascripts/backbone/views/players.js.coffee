class Worldcup.Views.Players extends Backbone.View
  tagname: 'div'

  template: HandlebarsTemplates['backbone/templates/players']

  initialize: ->
    @listenTo @collection, 'sort', @render
    @listenTo @collection, 'reset', @render
    @collection.fetch({reset: true})
    
  events:
    "click th a" : "sortClick"

  sortClick: (e) ->
    e.preventDefault()
    column = $(e.currentTarget).text().toLowerCase()
    @collection.sortPlayers(column)
    
  render: ->
    @$el.html(@template(players: @collection.toJSON()))     
    @

  
  