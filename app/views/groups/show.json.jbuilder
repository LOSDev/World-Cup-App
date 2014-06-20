json.name @group.name
json.teams @group.teams
json.matches @group.matches do |match|
  json.extract! match, :id, :home_team, :away_team, :home_goals, :away_goals, :group_id
  json.play_time match.play_time.strftime("%d/%m/%Y at %H:%M Local time")
  json.url match_url(match, format: :json)
end