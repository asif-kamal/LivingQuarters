class AttractionsController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  include AttractionsHelper

  def index
    if params[:location_id]
      @location = Location.find_by(id: params[:location_id]) if params[:location_id]
      @attractions = @location.activities.sorted_asc
    else
      @ttractions = Attraction.all.sorted_asc
    end
  end

  def show

    @experience_reports = @attractions.comments
  end

  def new
    @location = Location.find_by(id: params[:location_id]) if params[:location_id]
    @attraction = Attraction.new
  end

  def create
    create_logic
  end

  def edit
  end

  def update
    if @attraction.update(activity_params)
      redirect_to @attraction
    else
      render :edit
    end
  end

  def destroy
    @attraction.destroy
    redirect_to attractions_path
  end


  private

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attraction_params
    params.require(:activity).permit(:name, :description, :location_id)
  end

  def create_logic
    @attraction = Attraction.create(activity_params)

      redirect_to activity_path(@activity)
    
  end

end
