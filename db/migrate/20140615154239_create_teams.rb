class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :win
      t.integer :draw
      t.integer :loss
      t.integer :gf
      t.integer :ga
      t.integer :points
      t.references :group, index: true

      t.timestamps
    end
  end
end
