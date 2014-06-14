class Worldcup.Models.Group extends Backbone.Model
  paramRoot: 'group'

  defaults:
    name: null

class Worldcup.Collections.Groups extends Backbone.Collection
  model: Worldcup.Models.Group
  url: '/groups'
