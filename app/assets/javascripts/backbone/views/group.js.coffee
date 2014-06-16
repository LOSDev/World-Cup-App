class Worldcup.Views.Group extends Backbone.View
  template: HandlebarsTemplates['backbone/templates/group']
  tagName: 'div'
  className: 'btn-group'
  events:
    'click': "showDetails"

  showDetails: (e) ->
    e.preventDefault()
    
    Worldcup.Vent.trigger "group:show", @model
    Backbone.history.navigate "/groups/" + @model.attributes.name


  render: ->
    @$el.html(@template(@model.toJSON()))
    @