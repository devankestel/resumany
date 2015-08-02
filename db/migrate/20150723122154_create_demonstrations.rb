class CreateDemonstrations < ActiveRecord::Migration
  def change
    create_table :demonstrations do |t|
      t.string :description
      t.boolean :core, default: false
      t.string :subset
      t.string :display
      t.string :category
      t.string :cert
      t.integer :experience_id

      t.timestamps null: false
    end
  end
end
