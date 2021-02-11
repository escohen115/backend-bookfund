class AddEligibleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :eligible, :boolean
  end
end
