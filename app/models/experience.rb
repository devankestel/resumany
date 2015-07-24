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
end
