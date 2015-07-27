class ResumesController < ApplicationController
  def show
    set_instances
  end

  private

  def set_instances
    @resume = Resume.find(1)
    @route = params[:id]
    @links = @resume.links.all
    @educational_experiences = @resume.experiences.where(category: "education")
    @paid_experiences = @resume.experiences.where(category: "paid")
    @resume.write_txt(@route)
    @resume.write_docx(@route)
  end

end

