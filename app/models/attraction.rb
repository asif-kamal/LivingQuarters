class Attraction < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :description

  has_many :comments




  belongs_to :location
  belongs_to :host

  def self.sorted_asc
    order(name: :asc)
  end

end
