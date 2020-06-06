class Assignment < ApplicationRecord
validates_presence_of :rating

belongs_to :host, optional: true
belongs_to :attraction
belongs_to :location, optional: true

def self.order_by_filled
  order(:filled)
end

end
