class Worldcup.Views.MatchesNav extends Backbone.View

  template: HandlebarsTemplates['backbone/templates/matches_nav']

  render: ->
    @$el.html(@template())
    @