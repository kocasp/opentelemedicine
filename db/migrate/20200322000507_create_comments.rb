class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :patient_id
      t.text :content
      t.integer :author_id
    end
  end
end
