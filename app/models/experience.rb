class Experience < ActiveRecord::Base
  belongs_to :resume
  has_many :demonstrations

  accepts_nested_attributes_for :demonstrations, allow_destroy: true

  def daterange
    if self.start_year
      "#{Date::MONTHNAMES[self.start_month]} #{self.start_year} - #{Date::MONTHNAMES[self.end_month]} #{self.end_year}"
    else
      "#{Date::MONTHNAMES[self.end_month]} #{self.end_year}"
    end
  end

  def category_name
    
    if self.category == "education" || self.category == "skills"
      self.category.humanize
    else
      "#{self.category.humanize} Experience"
    end  
     

  end

  def selected_demos(name)
    if name == "cv"
      self.demonstrations.all
    else
      (self.demonstrations.where(core: true) + self.demonstrations.tagged_with(name)).sort_by(&:id) 
    end
  end
end
