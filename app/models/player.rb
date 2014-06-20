class Player < ActiveRecord::Base
  belongs_to :team


  validates :last_name, :goals, :assists, :matches, :team_id, presence: true

  validates :matches, numericality: { only_integer: true, less_than_or_equal_to: 7 }
end
