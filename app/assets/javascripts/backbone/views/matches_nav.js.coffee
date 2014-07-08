class Worldcup.Views.MatchesNav extends Backbone.View

  template: HandlebarsTemplates['backbone/templates/matches_nav']

  initialize: ->
    @activeTab = null
    @listenTo @collection, 'reset', @render
    @listenTo Worldcup.Vent, 'set:matchTab', (tab) ->
      @setMatchTab(tab)
    @collection.fetch({reset: true})

  render: ->
    
    @$el.html(@template(groups: @collection.toJSON()))
    @setMatchTab(@activeTab)
    @

  setMatchTab: (tab) ->
    @$('.match-nav-item').removeClass('active')
    @$(tab).addClass("active")
    @activeTab = tab
