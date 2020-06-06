module HostsHelper

  def location_name(attraction)
    Location.find_by(id: attraction.location_id).name
  end

end
