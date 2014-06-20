class Worldcup.Models.Player extends Backbone.Model
  urlRoot: '/players'

  

class Worldcup.Collections.Players extends Backbone.Collection
  model: Worldcup.Models.Player
  url: '/players'
  sortAttribute: "goals"

  sortPlayers: (attr) ->
    @sortAttribute = attr
    @sort()

  comparator: (model) ->
    return -model.get(@sortAttribute)
