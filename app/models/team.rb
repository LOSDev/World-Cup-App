class Team < ActiveRecord::Base
  belongs_to :group

  validates_uniqueness_of :name

  scope :ordered, order('name ASC')
end
