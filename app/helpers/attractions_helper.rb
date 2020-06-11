module AttractionsHelper
  def attraction_delete_link
    if current_user.admin
       link_to "Delete Attraction", @attraction, method: :delete, data: { confirm: "Delete This Attraction?" }
    end
  end

  def attraction_edit_link
    if current_user.admin
      link_to "Edit this Attraction", edit_attraction_path(@attraction)
    end
  end

  def attraction_index_header
    if @location
      "#{@location.name} Attractions"
    else
      "Attractions"
    end
  end

end
