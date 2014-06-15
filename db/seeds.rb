# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Group.create(name: "A")
Group.create(name: "B")
Group.create(name: "C")
Group.create(name: "D")
Group.create(name: "E")
Group.create(name: "F")
Group.create(name: "G")
Group.create(name: "H")

Team.create(name: "Brazil", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id: Group.find_by_name("A").id)
Team.create(name: "Mexico", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:1)
Team.create(name: "Cameroon", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:1)
Team.create(name: "Croatia", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:1)

Team.create(name: "Netherlands", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id: Group.find_by_name("B").id)
Team.create(name: "Chile", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:2)
Team.create(name: "Australia", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:2)
Team.create(name: "Spain", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:2)

Team.create(name: "Colombia", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id: Group.find_by_name("C").id)
Team.create(name: "Japan", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:3)
Team.create(name: "Cote D'Ivoire", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:3)
Team.create(name: "Greece", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:3)

Team.create(name: "Costa Rica", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id: Group.find_by_name("D").id)
Team.create(name: "Italy", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:4)
Team.create(name: "England", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:4)
Team.create(name: "Uruguay", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:4)

Team.create(name: "France", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id: Group.find_by_name("E").id)
Team.create(name: "Honduras", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:5)
Team.create(name: "Switzerland", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:5)
Team.create(name: "Equador", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:5)

Team.create(name: "Argentina", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id: Group.find_by_name("F").id)
Team.create(name: "Bosnia and Herzegovina", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:6)
Team.create(name: "Iran", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:6)
Team.create(name: "Nigeria", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:6)

Team.create(name: "Germany", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id: Group.find_by_name("G").id)
Team.create(name: "Portugal", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:7)
Team.create(name: "USA", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:7)
Team.create(name: "Ghana", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:7)

Team.create(name: "Belgium", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id: Group.find_by_name("H").id)
Team.create(name: "Algeria", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:8)
Team.create(name: "Russia", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:8)
Team.create(name: "Korea Republic", win:"0", draw:"0", loss:0, gf:0, ga:0, points:0, group_id:8)
