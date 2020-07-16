class Host < ApplicationRecord
  has_secure_password
  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :assignments
  has_many :attractions, through: :assignments

  has_many :locations, through: :assignments

  has_many :experience_reports

  #has_many :reported_attractions, through: :experience_reports, source: :attraction










end
