class Worldcup.Views.GroupDetails extends Backbone.View
  template: HandlebarsTemplates['backbone/templates/group_details']

  initialize: ->
    @listenTo @model, 'sync', @renderGroupDetails
    
    @model.fetch()


  renderGroupDetails: ->
    
    c = new Worldcup.Collections.Matches()
    c.add(@model.get("matches"))
    
    v = new Worldcup.Views.Matches({collection:c})
    @$el.html(@template(@model.toJSON()))
    @$el.append(v.render().el)

  render: ->
    @$el.html(@template(@model.toJSON()))
    @