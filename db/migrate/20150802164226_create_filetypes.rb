class CreateFiletypes < ActiveRecord::Migration
  def change
    create_table :filetypes do |t|
      t.string :category
      t.integer :download_id

      t.timestamps null: false
    end
  end
end
