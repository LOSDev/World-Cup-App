class Worldcup.Views.MatchDetails extends Backbone.View
  template: HandlebarsTemplates['backbone/templates/match_details']

  initialize: ->
    @listenTo @model, 'sync', @render
    
    @model.fetch()



  render: ->
    @$el.html(@template(@model.toJSON()))
    @