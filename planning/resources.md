Acts_As_Taggable_On Gem

  Documentation
    https://github.com/mbleigh/acts-as-taggable-on/

  Kick-Ass Blog Post 
    http://easyactiverecord.com/blog/2014/10/21/tagging-your-content-using-the-acts-as-taggable-on-gem/

Paperclip Gem

  Documentation
    https://github.com/thoughtbot/paperclip
  
  Video Tutorial by Mackenzie Child (10 minutes)
    https://www.youtube.com/watch?v=Z5W-Y3aROVE    

PDF, docx, txt Generation

  Stack Overflow Question
    http://stackoverflow.com/questions/30590785/what-is-the-best-way-to-generate-pdf-html-docx-in-ruby-rails

  Prawn Documentation (PDF generation from data)
    https://github.com/prawnpdf/prawn

  Prawn Manual
    http://prawnpdf.org/manual.pdf

  Prawn Simple Invoice Example 
    https://github.com/fadhlirahim/prawn-examples/blob/master/examples/invoice.rb

  Prawn Rails? (What's the difference?)
    https://github.com/cortiz/prawn-rails

  Prawn Bullets
    http://stackoverflow.com/questions/10513581/using-lists-in-prawn

    items = ["first","second","third"]
    def bullet_list(items)
      start_new_page if cursor < 50
      items.each do |item|
        text_box "•", at: [13, cursor]
        indent(30) do
          text item
        end
      end
    end

    OR

    def bullet_item(level = 1, string)
      indent (15 * level), 0 do
          text "• " + string
      end
    end
    
    Simply call this method like so:

    bullet_item(1, "Text for bullet point 1")
    bullet_item(2, "Sub point")

    def list(*items)
      RHYTHM  = 10
      LEADING = 2
      BLACK = "000000"
      move_up(RHYTHM)

      inner_box do
        font("Helvetica", :size => 11) do
          items.each do |li|
              float { text("•", :color => DARK_GRAY) }
              indent(RHYTHM) do
                text(li.gsub(/\s+/," "),
                     :inline_format => true,
                     :color         => BLACK,
                     :leading       => LEADING)
              end
              move_down(RHYTHM)
          end
        end
      end
    end

    RHYTHM  = 10
    LEADING = 2

  Wicked PDF Documentation (generation directly from HTML)
    https://github.com/mileszs/wicked_pdf

  Combine PDF Documentation (just what it sounds like, merges PDFs together)
    https://github.com/boazsegev/combine_pdf

  PDFCrowd Documentation (like Wicked, but uses API + key)
    https://github.com/pdfcrowd/pdfcrowd-ruby

  Docx Documentation (Docx reader and writer, still in development but stable)
    https://github.com/chrahunt/docx

  Ruby Native Docx Generation (that doesn't seem to include ability to change font, actually it does!)
    https://github.com/magicienap/docx_generator

Cocoon Gem for jQuery forms 

Date::MONTHNAMES

Open Office (docx format)
  Specification

  Notes
    Tab stop 
      <style:properties>
      <style:tab-stops>
      <style:tab-stop style:position="2cm"/>
      <style:tab-stop style:position="4cm"/>
      </style:tab-stops>
      </style:properties>

      <!ATTLIST style:tab-stop style:position %length; #REQUIRED>
      <!ATTLIST style:tabtype style:type (left|center|right|char) "left">
      <!ATTLIST style:tab-stop style:char %char; #IMPLIED>
      <!ATTLIST style:tab-stop style:leader-char %char; " "> 

      <text:ordered-list text:style-namep"List 1">
      <text:list-item>
      <text:p<This is the first list item</text:p>
      <text:p<This is a continuation of the first list item.</text:p>
      </text:list-item>
      <text:list-item>
      <text:p<This is the second list item.
      It contains an unordered sub list.</text:p>
      <text:unordered-list>
      <text:list-item<<text:p<This is a sub list item.</text:p>
      <text:list-item<<text:p<This is a sub list item.</text:p>
      <text:list-item<<text:p<This is a sub list item.</text:p>
      </text:unordered-list>
      </text:list item>
      <text:list-item>
      <text:p<This is the thirt list item</text:p>
      </text:list-item>
      </text:ordered-list>

Rendering Partials

  API.rubyonrails.org
    http://api.rubyonrails.org/classes/ActionView/PartialRenderer.html

Sketch Resources (Assets and Plug-ins)

  http://www.sketchappsources.com/

Writing A Text File from Ruby Data
  
  File.open(yourfile, 'w') { |file| file.write("your text") }

  Can also use eithet puts or << 
    http://alvinalexander.com/blog/post/ruby/how-write-text-to-file-ruby-example

Humanize Method
  http://apidock.com/rails/String/humanize

Tableize? 

All the stringy thingies
  http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html#method-i-camelize

:collection – customizes the options available in the select by passing in a collection (an Array or Hash)

ActiveRecord Relation Query Merge
  http://jpospisil.com/2014/06/16/the-definitive-guide-to-arel-the-sql-manager-for-ruby.html

Haml to Erb
  https://haml2erb.org/

Utilizing Cocoon for Nested Attributes with Formtastic

  <div id="tasks">
    <%= f.semantic_fields_for :tasks do |task| %>
      <%= render 'task_fields', f: task %>
    <% end %>
    <div class="links">
      <%= link_to_add_association 'add task', f, :tasks %>
    </div>
  </div>

  <div class="nested-fields">
    <%= f.inputs do %>
      <%= f.input :description %>
      <%= f.input :done, as: :boolean %>
      <%= link_to_remove_association "remove task", f %>
    <% end %>
  </div>

HTML Safe ERB
  http://stackoverflow.com/questions/4576932/ruby-on-rails-how-to-render-a-string-as-html

Limit Number of Nested Resources Cocoon
  http://stackoverflow.com/questions/12934925/cocoon-add-association-how-to-limit-number-of-associations

Cask Fonts!
  https://github.com/caskroom/homebrew-fonts/tree/master/Casks

Permit Nested Attributes
  http://stackoverflow.com/questions/17436264/how-to-use-rails-4-strong-parameters-with-has-many-through-association




