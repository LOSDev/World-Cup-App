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

  initialize: (models, options) ->
    @page = 1
    @perPage = 10

  
  showPage: () ->  
    result = @first(@page * @perPage)
    startAt = ((@page - 1) * @perPage)  
    result = result.slice(startAt)
    return new Worldcup.Collections.Players(result).sortPlayers(@sortAttribute)

  nextPage: ->
    @page = @page + 1 if @page < Math.ceil(@length / @perPage)

  previousPage: ->
    @page = @page - 1 if @page > 1

  switchPage: (p) ->
    if p > 0 and p <= @getLastPage()
      @page = p

  lastPage: ->
    @page = @getLastPage()

  getLastPage: ->
    Math.ceil(@length / @perPage)

  firstPage: ->
    @page = 1


  htmlString: ->
    result = ""
    result += "<li><a href=\"#\">Previous</a></li>" unless @page is 1
    arr = [1..@getLastPage()]
    for num in arr
      result += "<li><a href=\"#\">#{num}</a></li>"

    result += "<li><a href=\"#\">Next</a></li>" unless @page is @getLastPage()
    return result
