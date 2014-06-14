class Worldcup.Views.AppNav extends Backbone.View

  template: HandlebarsTemplates['backbone/templates/app_nav']

  render: ->
    @$el.html(@template())
    @