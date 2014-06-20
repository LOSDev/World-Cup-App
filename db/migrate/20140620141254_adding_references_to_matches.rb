class AddingReferencesToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :home_team_id, :integer
    add_column :matches, :away_team_id, :integer

    
    remove_column :matches, :home_team, :string
    remove_column :matches, :away_team, :string

  end
end
