class Worldcup.Models.Match extends Backbone.Model
  urlRoot: '/matches'
  parse: (resp, xhr) ->
  
    date = new Date(resp.play_time)
    
    resp.startYear = date.getFullYear()
    resp.startMonth = @padStr(date.getMonth() + 1)
    resp.startDay = @padStr(date.getDate())    
    resp.startHours =  @padStr(date.getHours())
    
    resp.startMinutes =  @padStr(date.getMinutes())
    
    resp

  padStr: (i) ->
    if i < 10 then "0" + i else i


  

class Worldcup.Collections.Matches extends Backbone.Collection
  model: Worldcup.Models.Match
  url: '/matches'

  
  todaysMatches: (date) ->    
    filtered = @filter((data) =>
      return false if data.get("startYear") isnt @padStr(date.getFullYear())
      return false if data.get("startMonth") isnt @padStr(date.getMonth() + 1)
      return false if data.get("startDay") isnt @padStr(date.getDate())
      return true
      )
    
    new Worldcup.Collections.Matches(filtered)
    

  recentMatches: (date) ->    
    filtered = @filter((data) =>
      return false if data.get("startYear") > @padStr(date.getFullYear())
      return false if data.get("startMonth") > @padStr(date.getMonth() + 1)
      return false if data.get("startDay") >= @padStr(date.getDate())
      return true
      )
    new Worldcup.Collections.Matches(filtered)

  knockoutMatches: (date) ->    
    filtered = @filter((data) =>
      return false if data.get("match_type") is null
      return true
      )
    
    new Worldcup.Collections.Matches(filtered)
    

  padStr: (i) ->
    if i < 10 then "0" + i else i

