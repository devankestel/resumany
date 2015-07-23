class Experience < ActiveRecord::Base
  belongs_to :resume
  has_many :demonstrations
end
