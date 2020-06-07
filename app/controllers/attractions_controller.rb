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
    @assignments = @attractions.assignments.order_by_filled
    @experience_reports = @attractions.experience_reports
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
    if @attraction.save
      2.times do
        @attraction.assignments.create(:attraction_id => @attraction.id, :location_id => @attraction.location_id, :filled => false, :rating => 0)
      end
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

      redirect_to attraction_path(@attraction)

  end
