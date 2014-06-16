class Worldcup.Views.Matches extends Backbone.View
  tagname: 'div'

  #template: HandlebarsTemplates['backbone/templates/matches']

  initialize: ->
    @listenTo @collection, 'reset', @render
    @collection.fetch({reset: true})
    


  render: ->
    @$el.html()
    @collection.forEach @renderMatches, @      
    @

  renderMatches: (model) ->   
    v = new Worldcup.Views.Match({model: model})
    @$el.append(v.render().el)

  