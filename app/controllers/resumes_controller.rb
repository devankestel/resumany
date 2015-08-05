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

  def edit
    set_instances
    @years = (1900..2015).to_a.reverse!
    @editing = true
    render 'new'
  end

  def create
    @resume = Resume.create(resume_params)
    @resume.displays.create(category: "skill", placement: 1)
    @resume.displays.create(category: "education", placement: 2)
    @resume.displays.create(category: "bonanza", placement: 3)

    redirect_to resume_path(@resume)
  end

  def update
    @resume = Resume.find(params[:id])
    @resume.update_attributes(resume_params)
    set_instances
    render 'show'
  end

  def download
    @download = Download.new()
  end

  private

  # def download_params
  #   params.require(:download).permit(:route, :header_font, :prose_font, :filetype_attributes[:category])
  # end

  def set_instances
    @resume = Resume.find(params[:id])
    @route = params[:id]
    @links = @resume.links.all
    set_experiences(@resume, ["skill", "education", "paid"])
    #@educational_experiences = @resume.experiences.where(category: "education")
    #@paid_experiences = @resume.experiences.where(category: "paid")
    #@resume.write_txt(@route)
    #@resume.write_docx(@route)
    #@resume.write_pdf(@route)
  end

  def set_experiences(resume, ordered_array)
    @experiences_collections = []
    ordered_array.each do |category|
      collection = resume.experiences.where(category: category)
      @experiences_collections << collection
    end
    @experiences_collections
  end
  def resume_params
     params.require(:resume).permit(:id, :name, :profile, :email, :phone, 
                                    links_attributes: [:id, :title, :url, :resume_id],
                                    displays_attributes: [:id, :placement, :category, :resume_id], 
                                    experiences_attributes: [:id, :resume_id, :title, :description, :organization, :start_month, :star_year, :end_month, :end_year, :category, :city, :state_or_country, :present, demonstrations_attributes: [:id, :experience_id, :description, :core, :subset, :category, :display]]
                                    )
  end
  
end

