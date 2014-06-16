class Worldcup.Models.Group extends Backbone.Model
  urlRoot: "/groups"
  idAttribute: 'name'
class Worldcup.Collections.Groups extends Backbone.Collection
  model: Worldcup.Models.Group
  url: '/groups'
