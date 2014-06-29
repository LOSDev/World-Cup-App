class Worldcup.Views.MatchesNav extends Backbone.View

  template: HandlebarsTemplates['backbone/templates/matches_nav']

  initialize: ->
    @listenTo @collection, 'reset', @render
    
    @collection.fetch({reset: true})

  render: ->
    @$el.html(@template(groups: @collection.toJSON()))
    @