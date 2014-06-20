json.name @group.name
json.teams @group.teams do |team|
  json.extract! team, :id, :name, :points, :win, :loss, :draw, :ga, :gf
  json.flag image_tag(team.flag.gsub(/\s+/, ""), width: '40')
end
json.matches @group.matches do |match|
  json.extract! match, :id, :home_team, :away_team, :home_goals, :away_goals, :group_id
  json.play_time match.play_time.strftime("%d/%m/%Y at %H:%M Local time")
  json.url match_url(match, format: :json)
end