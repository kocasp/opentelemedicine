class AddCovidSuspectToCase < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :covid_suspected, :boolean
  end
end
