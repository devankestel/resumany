class Experience < ActiveRecord::Base
  belongs_to :resume
  has_many :demonstrations

  def daterange
    if self.start_year
      "#{Date::MONTHNAMES[self.start_month]} #{self.start_year} - #{Date::MONTHNAMES[self.end_month]} #{self.end_year}"
    else
      "#{Date::MONTHNAMES[self.end_month]} #{self.end_year}"
    end
  end

  def selected_demos(name)
    if name == "cv"
      self.demonstrations.all
    else
      # basic logic but this is going to need some refinement
      # self.demonstrations.where(tag: resume_name)
      #just left this way so that i have a collection of something for testing
      #that is different from the collection in the 'if' statement
      (self.demonstrations.where(core: true) + self.demonstrations.tagged_with(name)).sort_by(&:id) 
    end
  end
end
