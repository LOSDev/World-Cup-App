class Worldcup.Views.Groups extends Backbone.View
  template: HandlebarsTemplates['backbone/templates/groups']

  initialize: ->
    @listenTo @collection, 'reset', @render
    @collection.fetch({reset: true})

  render: ->
    @$el.html(@template())
    @collection.forEach @renderGroup, @
    @

  renderGroup: (model) ->
    v = new Worldcup.Views.Group({model: model})
    @$('ul').append(v.render().el)