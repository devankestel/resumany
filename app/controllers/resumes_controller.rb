class ResumesController < ApplicationController
  def show
    set_instances
  end

  private

  def set_instances
    @resume = Resume.find(params[:id])
    @links = @resume.links.all
    @experiences = @resume.experiences.all
  end
  
end

