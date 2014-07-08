class Worldcup.Views.GroupDetails extends Backbone.View
  template: HandlebarsTemplates['backbone/templates/group_details']

  initialize: ->
    @listenTo @model, 'sync', @renderGroupDetails
    
    @model.fetch()


  renderGroupDetails: ->
    
    c = new Worldcup.Collections.Matches()
    c.add(@model.get("matches"), {parse: true})
    @groupMatches = new Worldcup.Views.Matches({collection:c})
    @$el.html(@template(@model.toJSON()))
    @$el.append(@groupMatches.render().el)

  render: ->
    #@$el.html(@template(@model.toJSON()))
    @