class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  include AssignmentsHelper

  def index
    set_index_variables
  end

  def show
    @attraction = @assignment.attraction
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.create(assignment_params)
    if @assignment.save!
      redirect_to assignments_path(@assignment)
    else
      render :new
    end
  end

  def edit
  end

# not sure how to 'render' to the nested path here
  def update
    if params[:assignment]==nil
      flash[:notice] = "Invalid Entry - Please Try Again"
      redirect_to host_assignments_path(current_user)
    elsif @assignment.update(assignment_params)
      redirect_to host_assignments_path(current_user)
    end
  end

  def destroy
    @assignment.destroy
    redirect_to assignments_path
  end



  private

  def set_assignment
    @assignment = Assignment.find_by(id: params[:id])
  end


  def assignment_params
    params.require(:assignment).permit(:name, :filled, :rating, :host_id, :attraction_id, :location_id)
  end


  def set_index_variables
    if params[:host_id]
      @host = Host.find_by(id: params[:host_id])
      @assignments = @host.assignments
    else
      @assignments = Assignment.all
    end
    @locations = Location.all
  end

end
