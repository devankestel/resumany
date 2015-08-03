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
    @years = (1900..2015).to_a.reverse!
  end

  def create
  end
  def download
    @download = Download.new()
  end

  private

  # def download_params
  #   params.require(:download).permit(:route, :header_font, :prose_font, :filetype_attributes[:category])
  # end

  def set_instances
    @resume = Resume.find(1)
    @route = params[:id]
    @links = @resume.links.all
    set_experiences(@resume, ["skill", "education", "paid"])
    #@educational_experiences = @resume.experiences.where(category: "education")
    #@paid_experiences = @resume.experiences.where(category: "paid")
    #@resume.write_txt(@route)
    #@resume.write_docx(@route)
    @resume.write_pdf(@route)
  end

  def set_experiences(resume, ordered_array)
    @experiences_collections = []
    ordered_array.each do |category|
      collection = resume.experiences.where(category: category)
      @experiences_collections << collection
    end
    @experiences_collections
  end

end

