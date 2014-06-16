json.array!(@matches) do |match|
  json.extract! match, :id, :home_team, :away_team, :home_goals, :away_goals, :play_time, :group_id
  json.url match_url(match, format: :json)
end
