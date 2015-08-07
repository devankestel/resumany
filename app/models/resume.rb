require 'docx_generator'
require 'prawn'

class Resume < ActiveRecord::Base

  belongs_to :user

  has_many :experiences
  has_many :links
  has_many :downloads
  has_many :displays
  has_many :demonstrations, through: :experiences

  accepts_nested_attributes_for :links, allow_destroy: true
  accepts_nested_attributes_for :experiences, allow_destroy: true
  accepts_nested_attributes_for :demonstrations, allow_destroy: true
  accepts_nested_attributes_for :downloads
  accepts_nested_attributes_for :displays

  #accepts_nested_attributes_for :experience_demonstrations, allow_destroy: true

  has_attached_file :pdf
  has_attached_file :docx
  has_attached_file :txt

  validates_attachment_content_type :pdf, :content_type =>['application/pdf']
  validates_attachment_content_type :docx, :content_type =>['application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']
  validates_attachment_content_type :txt, :content_type =>['text/plain']

  # my_model_instance = MyModel.new
  # file = File.open(file_path)
  # my_model_instance.attachment = file
  # file.close
  # my_model_instance.save!

  def write_and_attach_docx(route)
    DocxGenerator::DSL::Document.new("/Users/devankestel1/Documents/resumany/app/assets/docx/#{route}") do |file|
      header_docx(file)
      experiences_docx(file, route)
      file.save
    end
    
    attach_docx = File.open("/Users/devankestel1/Documents/resumany/app/assets/docx/#{route}.docx")
    self.docx = attach_docx
    self.save!
    attach_docx.close

  end

  def write_and_attach_txt(route)
    # /Users/devankestel1/Documents/resumany/app/assets/txt/name.txt
    File.open("/Users/devankestel1/Documents/resumany/app/assets/txt/#{route}.txt", 'w') do |file| 
      header_txt(file)
      experiences_txt(file, route) 
    end
    attach_txt = File.open("/Users/devankestel1/Documents/resumany/app/assets/txt/#{route}.txt")
    self.txt = attach_txt
    self.save!
    attach_txt.close
  end

  def write_and_attach_pdf(route)
    file = Prawn::Document.new
    header_pdf(file)
    experiences_pdf(file, route)
    file.render_file "/Users/devankestel1/Documents/resumany/app/assets/pdf/#{route}.pdf"
    
    attach_pdf = File.open("/Users/devankestel1/Documents/resumany/app/assets/pdf/#{route}.pdf")
    self.pdf = attach_pdf
    self.save!
    attach_pdf.close

  end

  def header_pdf(file)
    file.text name
    file.text email
    file.text phone
    file.text profile
    file.text "  "
    file.text "  "
    link_text = self.links.map do |link|
      "#{link.title}: #{link.url}"
    end
    list_pdf(file, link_text)
    file.text " "
  end

  def experiences_pdf(file, route)
    #need to get experiences in the right order
    #borrow from set experiences method? 
    self.experiences.each do |experience|
      file.text experience.organization
      file.text experience.title
      file.text experience.daterange
        if experience.description
          file.text " "
          file.text experience.description
        end
      demo_text = experience.selected_demos(route).map do |demo|
        demo.description
      end
      if demo_text
        file.text " "
        file.text " "
        bullet_list(file, demo_text)
        end
      file.text " "
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
      if profile
        par.text ""
        par.newline
      end
      if profile
        par.text profile
      end
      par.text ""
      par.newline
    end
    file.paragraph do |par|
      self.links.each do |link|
        par.text "     • #{link.title}: #{link.url}"
        par.newline
      end
    end
  end
  
  def experiences_docx(file, route)
    self.experiences.each do |experience|
      file.paragraph do |par|
        demos = true
        par.text experience.organization
        par.newline
        par.text experience.title
        par.newline
        par.text experience.daterange
        par.newline
       
        if experience.description
          par.text ""
          par.newline
          par.text experience.description
          par.newline
          
        end 
        experience.selected_demos(route).each do |demo|
          if demos
            par.text ""
            par.newline
            demos = false
          end
          par.text "• #{demo.description}"
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

  def bullet_list(file, items)
      file.start_new_page if file.cursor < 50
      items.each do |item|
        file.text_box "•", at: [13, file.cursor]
        file.indent(30) do
          file.text item
        end
      end
    end

  def list_pdf(file, items)
      rhythm  = 5
      leading = 1
      black = "000000"
      file.move_up(rhythm)

      inner_box(file) do
        file.font("Helvetica", :size => 11) do
          items.each do |li|
              file.float { file.text("•", :color => black) }
              file.indent(rhythm) do
                file.text(li.gsub(/\s+/," "),
                     :inline_format => true,
                     :color         => black,
                     :leading       => leading)
              end
              file.move_down(rhythm)
          end
        end
      end
  end

  def inner_box(file, &block)
        inner_margin = 30
        file.bounding_box([inner_margin, file.cursor],
                     :width => file.bounds.width - inner_margin*2,
                     &block)
  end
  ############ end of Class ##############
end
