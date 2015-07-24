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

  def selected_demos
    if self.resume.resume_name == "cv"
      self.demonstrations.all
    else
      # basic logic but this is going to need some refinement
      # self.demonstrations.where(tag: resume_name)
      #just left this way so that i have a collection of something for testing
      #that is different from the collection in the 'if' statement
      self.all  
    end
  end
end
