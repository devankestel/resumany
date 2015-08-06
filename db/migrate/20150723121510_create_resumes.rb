class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
    
      t.string :name
      t.string :resume_name
      t.string :email
      t.string :phone
      t.string :profile
      t.attachment :pdf
      t.attachment :txt
      t.attachment :docx
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
