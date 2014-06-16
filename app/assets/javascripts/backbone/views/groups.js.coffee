class Worldcup.Views.Groups extends Backbone.View


  template: HandlebarsTemplates['backbone/templates/groups']

  initialize: ->
    @listenTo @collection, 'reset', @render
    @listenTo Worldcup.Vent, "group:show", @groupShow
    @collection.fetch({reset: true})
    
    m = new Worldcup.Models.Group({name: @id})
    
    Worldcup.Vent.trigger "group:show", m

  groupShow: (model) ->
    v = new Worldcup.Views.GroupDetails({model: model})
    @swapGroupDetails(v)


  render: ->
    @$el.html(@template())
    @collection.forEach @renderGroup, @ 
    @$('#teams').html(@currentGroupDetailsView.render().el) 
    @

  renderGroup: (model) ->
   
    v = new Worldcup.Views.Group({model: model})
    @$('.btn-toolbar').append(v.render().el)

  changeGroupView: (v) ->
    @currentGroupDetailsView = v

  swapGroupDetails: (v) ->
    @changeGroupView(v)
    @$('#teams').html(@currentGroupDetailsView.render().el)




    

  