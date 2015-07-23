class Demonstration < ActiveRecord::Base
  acts_as_taggable
  belongs_to :experience
end
