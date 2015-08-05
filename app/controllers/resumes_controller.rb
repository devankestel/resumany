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
    unique_categories = @resume.experiences.map{|experience| experience.category}.uniq
    puts unique_categories
    set_default_display_order(@resume, unique_categories)
    #@resume.displays.create(category: "skill", placement: 1)
    #@resume.displays.create(category: "education", placement: 2)
    #@resume.displays.create(category: "paid", placement: 3)

    redirect_to resume_path(@resume)
  end

  def update
    @resume = Resume.find(params[:id])
    @resume.update_attributes(resume_params)
    unique_experience_categories = @resume.experiences.map{|experience| experience.category}.uniq.sort
    unique_display_categories = @resume.displays.map{|display| display.category}.uniq.sort
    if unique_experience_categories != unique_display_categories 
      @resume.displays.destroy_all
      set_default_display_order(@resume, unique_experience_categories)
    end
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
    ordered_displays = @resume.displays.all.order(:placement)
    ordered_array = ordered_displays.map{|display| display.category}
    set_experiences(@resume, ordered_array)
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
  def set_default_display_order(resume, categories)
    ordered_categories = []
    if categories.include?("skill")
      ordered_categories << "skill"
    end
    if categories.include?("education")
      ordered_categories << "education"
    end
    if categories.include?("paid")
      ordered_categories << "paid"
    end
    if categories.include?("unpaid")
      ordered_categories << "unpaid"
    end
    if categories.include?("volunteer")
      ordered_categories << "volunteer"
    end
    puts ordered_categories 
    ordered_categories.each do |category|
      placement = ordered_categories.index(category) + 1
      resume.displays.create(category: category, placement: placement)
    end  
  end
  def resume_params
     params.require(:resume).permit(:id, :name, :profile, :email, :phone, 
                                    links_attributes: [:id, :title, :url, :resume_id],
                                    displays_attributes: [:id, :placement, :category, :resume_id], 
                                    experiences_attributes: [:id, :resume_id, :title, :description, :organization, :start_month, :star_year, :end_month, :end_year, :category, :city, :state_or_country, :present, demonstrations_attributes: [:id, :experience_id, :description, :core, :subset, :category, :display]]
                                    )
  end
  
end

