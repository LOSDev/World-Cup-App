json.array!(@players) do |player|
  json.extract! player, :id, :first_name, :last_name, :matches, :goals, :assists
  json.flag image_tag(player.team.flag, width: '40')
  json.url player_url(player, format: :json)
end
