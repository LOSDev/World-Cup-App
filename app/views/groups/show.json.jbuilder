json.name @group.name
json.teams @group.teams.sort_by! { |team| [-team.points, team.ga-team.gf] } do |team|
  json.extract! team, :id, :name, :points, :win, :loss, :draw, :ga, :gf
  json.flag image_tag(team.flag, width: '40')
end
json.matches @group.matches do |match|
  json.extract! match, :id, :home_goals, :away_goals, :group_id
  json.home_team match.home_team
  json.away_team match.away_team
  json.home_flag image_tag(match.home_team.flag)
  json.away_flag image_tag(match.away_team.flag)
  json.play_time match.play_time.strftime("%d/%m/%Y at %H:%M Local time")
  json.url match_url(match, format: :json)
end