class Resume < ActiveRecord::Base
  has_many :experiences
  has_many :links
  has_many :demonstrations, through: :experiences

  has_attached_file :pdf 
  has_attached_file :docx 
  has_attached_file :txt

  validates_attachment_content_type :pdf, :content_type =>['application/pdf']
  validates_attachment_content_type :docx, :content_type =>['application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']
  validates_attachment_content_type :txt, :content_type =>['text/plain']

  def set_instances
    @resume = Resume.find(params[:id])
    @links = @resume.links.all
    @experiences = @resume.experiences.all
  end
end
