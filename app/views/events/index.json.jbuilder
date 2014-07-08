json.array!(@events) do |event|
  json.extract! event, :id, :type, :player, :minute, :match_id, :home_team, :away_team
  json.url event_url(event, format: :json)
end
