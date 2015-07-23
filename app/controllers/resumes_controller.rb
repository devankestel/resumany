class ResumesController < ApplicationController
  def show
    @resume = Resume.find(params[:id])
    @links = @resume.links.all
    @experiences = @resume.experiences.all
    @demonstrations = @experiences.demonstrations.all
  end
end
