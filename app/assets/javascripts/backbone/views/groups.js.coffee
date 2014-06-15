class Worldcup.Views.Groups extends Backbone.View


  template: HandlebarsTemplates['backbone/templates/groups']

  initialize: ->
    @listenTo @collection, 'reset', @render
    @listenTo Worldcup.Vent, "group:show", @groupShow
    @collection.fetch({reset: true})

  groupShow: (model) ->
    v = new Worldcup.Views.GroupDetails({model: model})
    @$('#teams').html(v.render().el)

  render: ->
    @$el.html(@template())
    @collection.forEach @renderGroup, @
    
    @

  renderGroup: (model) ->
    v = new Worldcup.Views.Group({model: model})
    @$('.btn-toolbar').append(v.render().el)


    

  