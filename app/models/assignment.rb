class Assignment < ApplicationRecord
validates_presence_of :rating

belongs_to :host, optional: true
belongs_to :attraction
belongs_to :location, optional: true

scope :day_of_the_week, ->(day) { where(day: day) }

def self.order_by_filled
  order(:filled)
end

end
