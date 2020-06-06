class ExperienceReport < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :content

  belongs_to :attraction
  belongs_to :host, optional: true

end
