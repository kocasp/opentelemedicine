class CreateCases < ActiveRecord::Migration[5.2]
  def change
    create_table :cases do |t|
      t.text :description
      t.text :solution
      t.string :specialist_type

      t.timestamps
    end
  end
end
