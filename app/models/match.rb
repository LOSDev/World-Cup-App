class Match < ActiveRecord::Base
  
  validates_presence_of :play_time

  has_many :events
  belongs_to :group
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
end
