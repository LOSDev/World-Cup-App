class Group < ActiveRecord::Base
  validates_inclusion_of :name, :in => %w(A B C D E F G H)

  validates_uniqueness_of :name

  has_many :teams
  has_many :matches
end
