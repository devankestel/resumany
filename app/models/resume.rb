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

  def write_txt(route)
    # /Users/devankestel1/Documents/resumany/app/assets/txt/name.txt
    File.open("/Users/devankestel1/Documents/resumany/app/assets/txt/name.txt", 'w') do |file| 
      file.puts name
      file.puts ""
      file.puts email
      file.puts phone
      file.puts ""
      self.links.each do |link|
        file.puts "  * #{link.title}: #{link.url}"
      end
    end
  end
end
