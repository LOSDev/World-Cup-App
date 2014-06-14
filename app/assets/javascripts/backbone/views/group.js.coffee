class Worldcup.Views.Group extends Backbone.View
  template: HandlebarsTemplates['backbone/templates/group']

  render: ->
    @$el.html(@template(@model.toJSON()))
    @