class Demonstration < ActiveRecord::Base
  acts_as_taggable
  belongs_to :experience

  def skill_display
    if display == "list"
      "<em>#{subset}</em>: #{description}"
    else
      #need to make this a multi-line response somehow
      "#{subset}<br /><br />#{description}"
    end
  end
end
