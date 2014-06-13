class Worldcup.Views.Header extends Backbone.View

  template: HandlebarsTemplates['backbone/templates/header']

  render: ->
    @$el.html(@template())
    @