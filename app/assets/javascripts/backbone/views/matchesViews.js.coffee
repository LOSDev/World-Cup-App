class Worldcup.Views.MatchesViews extends Backbone.View
  tagname: 'div'

  template: HandlebarsTemplates['backbone/templates/matches_views']

  

  render: ->
    @$el.html(@template(matches: @collection.toJSON()))
    @

  