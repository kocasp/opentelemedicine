class CreateSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :solutions do |t|
      t.text :description
      t.integer :case_id
      t.integer :author_id

      t.timestamps
    end
  end
end
