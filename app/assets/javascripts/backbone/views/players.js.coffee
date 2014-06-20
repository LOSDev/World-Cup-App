class Worldcup.Views.Players extends Backbone.View
  tagname: 'div'

  template: HandlebarsTemplates['backbone/templates/players']

  initialize: ->

    @listenTo @collection, 'reset', @render
    @collection.fetch({reset: true})
    


  render: ->
    @$el.html(@template(players: @collection.toJSON()))
    #@collection.forEach @renderPlayers, @      
    @

  renderPlayers: (model) ->   
    v = new Worldcup.Views.Player({model: model})
    @$el.append(v.render().el)

  