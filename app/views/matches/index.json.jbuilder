json.array!(@matches) do |match|
  json.extract! match, :id, :home_team, :away_team, :home_goals, :away_goals, :match_type
  if match.group
    json.group match.group.name
  end
  json.home_flag image_tag(match.home_team.flag)
  json.away_flag image_tag(match.away_team.flag)
  json.play_time match.play_time
  json.url match_url(match, format: :json)
end
