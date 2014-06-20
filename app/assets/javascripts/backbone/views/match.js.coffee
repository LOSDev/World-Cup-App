class Worldcup.Views.Match extends Backbone.View
  template: HandlebarsTemplates['backbone/templates/match']
  tagName: 'div'
  className: 'well well-sm'
  
    

  
  render: ->
    @$el.html(@template(@model.toJSON()))
    @