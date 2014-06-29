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

  teamMatches: (team) ->    
    filtered = @filter((data) =>
      return true if data.get("home_team_id") is parseInt(team)
      return true if data.get("away_team_id") is parseInt(team)
      return false
      )
    new Worldcup.Collections.Matches(filtered)

  
  todaysMatches: (date) ->    
    filtered = @filter((data) =>
      return false if data.get("startYear") isnt @padStr(date.getFullYear())
      return false if data.get("startMonth") isnt @padStr(date.getMonth() + 1)
      return false if data.get("startDay") isnt @padStr(date.getDate())
      return true
      )
    
    new Worldcup.Collections.Matches(filtered)

  nextMatches: (date) ->
    filtered = @filter((data) =>
      return false if Date.parse(data.get("play_time")) < Date.parse(date)      
      return true
      )    
    
    col = new Worldcup.Collections.Matches(filtered).last(8)
    new Worldcup.Collections.Matches(col)
    

  recentMatches: (date) ->    
    filtered = @filter((data) =>
      return false if Date.parse(data.get("play_time")) > Date.parse(date)      
      return true
      )    
    
    col = new Worldcup.Collections.Matches(filtered).last(8).reverse()
    new Worldcup.Collections.Matches(col)

  knockoutMatches: (round) ->    
    filtered = @filter((data) =>
      return true if data.get("match_type") is round
      return false
      )
    
    new Worldcup.Collections.Matches(filtered)
    

  padStr: (i) ->
    if i < 10 then "0" + i else i

