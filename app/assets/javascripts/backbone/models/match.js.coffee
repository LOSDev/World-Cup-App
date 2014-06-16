class Worldcup.Models.Match extends Backbone.Model
  urlRoot: '/matches'

  

class Worldcup.Collections.Matches extends Backbone.Collection
  model: Worldcup.Models.Match
  url: '/matches'
