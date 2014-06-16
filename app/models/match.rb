class Match < ActiveRecord::Base
  validates_presence_of :home_team
  validates_presence_of :away_team
  validates_presence_of :home_goals
  validates_presence_of :away_goals
  validates_presence_of :play_time
  belongs_to :group
end
