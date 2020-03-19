class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_type
      t.string :first_name
      t.string :last_name
      t.string :pesel
      t.string :address
      t.string :phone
      t.string :pwz_number
      t.date :dob
      t.integer :age
      t.float :weight
      t.float :height

      t.timestamps
    end
  end
end
