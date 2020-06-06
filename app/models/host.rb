class Host < ApplicationRecord
  has_secure_password
  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :email
  validates_uniqueness_of :email


  has_many :attractions, through: :locations




  # look into this improvement suggestion from Jennifer (Jenn) Hansen during my rails project assessment:
  
  # maybe source: :activities


end
