class AddSponsorDateToWaitings < ActiveRecord::Migration[6.1]
  def change
    add_column :waitings, :sponsor_date, :string
  end
end
