class ResumesController < ApplicationController
  def show
    @resume = Resume.find(params[:id])
    @links = @resume.links.all
    @experiences = @resume.experiences.all
    #@demonstrations = @experiences.find_by(city: "Nicholasville").demonstrations.all
  end
end
