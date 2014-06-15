class Worldcup.Views.GroupDetails extends Backbone.View
  template: HandlebarsTemplates['backbone/templates/group_details']

  render: ->
    @$el.html(@template(@model.toJSON()))
    @