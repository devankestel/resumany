class ActsAsTaggableOn::Tag
   def url
    "/resumes/#{self.urlize}"
  end
  def urlize
    name.downcase.gsub(" ", "_")
  end
  def title
    name
  end
end