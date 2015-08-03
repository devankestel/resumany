class Download < ActiveRecord::Base
  has_many :filetypes
  belongs_to :resume
end
