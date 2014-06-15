#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Worldcup =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  Vent: _.clone(Backbone.Events)