class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]
  include AttractionsHelper


  def index
    if params[:search]
      @attractions = Attraction.search(params[:search])
    elsif params[:location_id]
      @location = Location.find_by(id: params[:location_id]) if params[:location_id]
      @attractions = @location.attractions.sorted_asc
    else
      @attractions = Attraction.all.sorted_asc
    end
  end

  def day_select
      @display_day = params[:day]
      @day = Attraction.day_of_the_week(@display_day)
    end

  def show
    @assignments = @attraction.assignments.order_by_filled
    @experience_reports = @attraction.experience_reports
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
    if @attraction.update(attraction_params)
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
    params.require(:attraction).permit(:name, :description, :location_id, :day, :search)
  end

  def day_param
    params.permit(:day)
  end

  def create_logic
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
        @attraction.assignments.create(:attraction_id => @attraction.id, :location_id => @attraction.location_id, :filled => false, :rating => 0)
  
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end
end
