class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :home_team
      t.string :away_team
      t.integer :home_goals
      t.integer :away_goals
      t.datetime :play_time
      t.references :group, index: true

      t.timestamps
    end
  end
end
