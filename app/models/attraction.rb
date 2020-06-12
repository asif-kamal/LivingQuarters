class Attraction < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :description

  has_many :experience_reports

  has_many :assignments
  has_many :hosts, through: :assignments


  belongs_to :location

  def self.sorted_asc
    order(name: :asc)
  end

end
