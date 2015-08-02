class CreateFiletypes < ActiveRecord::Migration
  def change
    create_table :filetypes do |t|
      t.string :category

      t.timestamps null: false
    end
  end
end
