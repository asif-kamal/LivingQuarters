class ExperienceReportController < ApplicationController
include ExperienceReportsHelper

  def new
    @experience_report = ExperienceReport.new
  end

  def create
    @experience_report = ExperienceReport.create(comment_params)
    if @experience_report.save
      redirect_to attraction_path(@experience_report.attraction_id)
    else
      flash[:notice] = "Fields Cannot be Blank"
      redirect_to attraction_path(@experience_report.attraction_id)
    end
  end



  private


  def experience_report_params
    params.require(:experience_report).permit(:title, :content, :host_id, :attraction_id)
  end

end
