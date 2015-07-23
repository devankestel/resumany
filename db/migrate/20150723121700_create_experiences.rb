class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :description
      t.string :organization
      t.integer :start_month
      t.integer :start_year
      t.integer :end_month
      t.integer :end_year
      t.string :category
      t.string :city
      t.string :state_or_country
      t.boolean :present, default: false
      t.integer :resume_id

      t.timestamps null: false
    end
  end
end
