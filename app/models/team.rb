class Team < ActiveRecord::Base
  belongs_to :group
  has_many :players

  validates_uniqueness_of :name

  scope :ordered, order('name ASC')
end
