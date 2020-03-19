class AddChronicDiseasesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :chronic_diseases, :text
  end
end
