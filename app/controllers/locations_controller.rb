class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  include LocationsHelper

  def index
    @locations = Location.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)
    if @location.save
      redirect_to location_path(@location)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to @location
    else
      render :edit
    end
  end


  private

  def set_location
    @location = Location.find_by(id: params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :location, :description)
  end

end
