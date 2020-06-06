class Location < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :description

  has_many :assignments
  has_many :hosts, through: :assignments
  
  has_many :attractions
  has_many :experience_reports, through: :attractions




end
