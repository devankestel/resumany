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

Writing A Text File from Ruby Data
  
  File.open(yourfile, 'w') { |file| file.write("your text") }

  Can also use eithet puts or << 
    http://alvinalexander.com/blog/post/ruby/how-write-text-to-file-ruby-example

