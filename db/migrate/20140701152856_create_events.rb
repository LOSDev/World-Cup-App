class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_type
      t.string :player
      t.string :minute
      t.references :match, index: true
      t.boolean :home_team
      t.boolean :away_team

      t.timestamps
    end
  end
end
