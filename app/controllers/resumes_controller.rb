class ResumesController < ApplicationController
  def show
    set_instances
  end

  def index
    set_instances
    experiences = @resume.experiences.all
    experiences.each do |experience|
      demos = experience.demonstrations.all
      demos.each do |demo|
        if @tags
          @tags += demo.tags.all
        else
          @tags = demo.tags.all
        end
      end
    end
    @tags = @tags.uniq
  end
  
  def new
    @resume = Resume.new()
    @links = @resume.links.new()
  end

  def create
  end

  private

  def set_instances
    @resume = Resume.find(1)
    @route = params[:id]
    @links = @resume.links.all
    @educational_experiences = @resume.experiences.where(category: "education")
    @paid_experiences = @resume.experiences.where(category: "paid")
    #@resume.write_txt(@route)
    #@resume.write_docx(@route)
    #@resume.write_pdf(@route)
  end

end

