class Worldcup.Views.Matches extends Backbone.View
  tagname: 'div'

  template: HandlebarsTemplates['backbone/templates/matches']

  initialize: ->
    @listenTo @collection, 'reset', @render
    @collection.fetch({reset: true}) if @collection.length is 0

  render: ->
    @$el.html(@template(matches: @collection.toJSON()))      
    @

  