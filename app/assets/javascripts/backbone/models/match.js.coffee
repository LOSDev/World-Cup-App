class Worldcup.Models.Match extends Backbone.Model
  urlRoot: '/matches'
  parse: (resp, xhr) ->
    console.log resp.play_time
    date = new Date(resp.play_time)
    
    resp.startYear = date.getFullYear()
    resp.startMonth = @padStr(date.getMonth())
    resp.startDay = @padStr(date.getDate())
    
    resp.startHours =  @padStr(date.getHours())
    
    resp.startMinutes =  @padStr(date.getMinutes())
    

    resp

  padStr: (i) ->
    if i < 10 then "0" + i else i


  

class Worldcup.Collections.Matches extends Backbone.Collection
  model: Worldcup.Models.Match
  url: '/matches'

  myFilter: (filters) ->
    results = @where(filters)
    new Worldcup.Collections.Matches(results)
