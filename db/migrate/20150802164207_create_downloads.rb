class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :route
      t.string :header_font
      t.string :prose_font
      t.boolean :pdf, default: false
      t.boolean :docx, default: false
      t.boolean :txt, default: false
      t.integer :resume_id


      t.timestamps null: false
    end
  end
end
