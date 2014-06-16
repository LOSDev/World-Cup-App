class Worldcup.Views.GroupDetails extends Backbone.View
  template: HandlebarsTemplates['backbone/templates/group_details']

  initialize: ->
    @listenTo @model, 'sync', @render
    
    @model.fetch()


  render: ->
    @$el.html(@template(@model.toJSON()))
    @