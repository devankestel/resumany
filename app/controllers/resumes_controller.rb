class ResumesController < ApplicationController
  def show
    set_instances
  end

  private

  def set_instances
    @resume = Resume.find(params[:id])
    @links = @resume.links.all
    @educational_experiences = @resume.experiences.where(category: "education")
    @paid_experiences = @resume.experiences.where(category: "paid")
  end

end

