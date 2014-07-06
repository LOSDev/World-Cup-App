class AddExtraTimeToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :extra_time, :string
  end
end
