class AddFlagToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :flag, :string

    Team.reset_column_information

    teams = Team.all
    teams.each do |team|
      file_name = team.name + ".png"
      #image = "<img alt=\"#{team.name}\" src=\"/assets/#{file_name}\" />"
      team.flag = file_name
      team.save
    end
  end
end
