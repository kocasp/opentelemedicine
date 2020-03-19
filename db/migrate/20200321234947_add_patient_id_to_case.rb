class AddPatientIdToCase < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :patient_id, :integer
  end
end
