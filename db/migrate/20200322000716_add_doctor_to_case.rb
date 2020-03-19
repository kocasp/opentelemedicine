class AddDoctorToCase < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :doctor_id, :integer
  end
end
