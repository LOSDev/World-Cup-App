class Team < ActiveRecord::Base
  belongs_to :group
  has_many :players
  has_many :matches
  validates_uniqueness_of :name

  scope :ordered, order('name ASC')

  def games
    Match.where("home_team_id = ? OR away_team_id = ?", self.id, self.id)
    
  end
end
