require 'docx_generator'

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

  def write_docx(route)
    DocxGenerator::DSL::Document.new("/Users/devankestel1/Documents/resumany/app/assets/docx/name") do |file|
      header_docx(file)
      experiences_docx(file, route)
      file.save
    end
  end

  def write_txt(route)
    # /Users/devankestel1/Documents/resumany/app/assets/txt/name.txt
    File.open("/Users/devankestel1/Documents/resumany/app/assets/txt/name.txt", 'w') do |file| 
      header_txt(file)
      experiences_txt(file, route) 
    end
  end
  
  def header_docx(file)
    file.paragraph do |par|
      par.text name
      par.newline
      par.text email
      par.newline
      par.text phone
      par.newline
      self.links.each do |link|
        par.text "     • #{link.title}: #{link.url}"
        par.newline
      end
      par.newline
    end
  end
  
  def experiences_docx(file, route)
    self.experiences.each do |experience|
      file.paragraph do |par|
        demos = false
        par.text experience.organization
        par.newline
        par.text experience.title
        par.newline
        par.text experience.daterange
        par.newline
        par.text ""
        par.newline
        #par.text experience.description if experience.description        
        experience.selected_demos(route).each do |demo|
          par.tab
          par.text "• #{demo.description}"
          par.newline
          demos = true
        end
        if demos
          par.text ""
          par.newline
        end
      end
    end
    # file.paragraph do |par|
    #     par.text ""
    #     par.newline
    # end
  end

  def header_txt(file)
    file.puts name
    file.puts ""
    file.puts email
    file.puts phone
    file.puts ""
    self.links.each do |link|
      file.puts "  * #{link.title}: #{link.url}"
    end
    file.puts ""
  end

  def experiences_txt(file, route)
    self.experiences.each do |experience|
      demos = false
      file.puts experience.organization
      file.puts experience.title
      file.puts experience.daterange
      file.puts experience.description if experience.description
      file.puts ""
      experience.selected_demos(route).each do |demo|
        file.puts "  * #{demo.description}"
        demos = true
      end
      file.puts "" if demos
    end
  end
end
