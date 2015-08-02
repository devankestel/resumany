class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :route
      t.string :header_font
      t.string :prose_font

      t.timestamps null: false
    end
  end
end
