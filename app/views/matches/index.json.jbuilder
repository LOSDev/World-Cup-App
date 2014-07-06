json.array!(@matches) do |match|
  json.extract! match, :id, :home_team, :away_team, :home_goals, :away_goals, :match_type, :home_team_id, :away_team_id, :extra_time
  if match.group
    json.group match.group.name
  end
  json.home_flag image_tag(match.home_team.flag, width: '50')
  json.away_flag image_tag(match.away_team.flag, width: '50')
  json.play_time match.play_time
  json.url match_url(match, format: :json)
end
