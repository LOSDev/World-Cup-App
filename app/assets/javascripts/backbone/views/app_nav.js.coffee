class Worldcup.Views.AppNav extends Backbone.View

  template: HandlebarsTemplates['backbone/templates/app_nav']

  events:
    "click .navbar-brand": "showGroups"
    "click .groups-link": "showGroups"
    "click .matches-link": "showMatches"
    "click .scorers-link": "showScorers"

  showGroups: (e) ->
    e.preventDefault()    
    Worldcup.Vent.trigger "groups:show"
    Backbone.history.navigate "/groups/A"

  showMatches: (e) ->
    e.preventDefault()  
    Worldcup.Vent.trigger "matches:show"  
    Backbone.history.navigate "/matches"

  showScorers: (e) ->
    e.preventDefault()    
    Worldcup.Vent.trigger "scorers:show"
    Backbone.history.navigate "/scorers"


  render: ->
    @$el.html(@template())
    @