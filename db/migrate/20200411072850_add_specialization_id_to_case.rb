class AddSpecializationIdToCase < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :specialization_id, :integer
  end
end
