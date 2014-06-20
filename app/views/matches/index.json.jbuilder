json.array!(@matches) do |match|
  json.extract! match, :id, :home_team, :away_team, :home_goals, :away_goals
  json.group match.group.name
  json.home_flag image_tag(match.home_team.flag)
  json.away_flag image_tag(match.away_team.flag)
  json.play_time match.play_time.strftime("%d/%m/%Y at %H:%M Local time")
  json.url match_url(match, format: :json)
end
