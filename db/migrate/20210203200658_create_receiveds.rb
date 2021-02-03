class CreateReceiveds < ActiveRecord::Migration[6.1]
  def change
    create_table :receiveds do |t|
      t.integer :user_id
      t.integer :book_id
      t.boolean :reviewed

      t.timestamps
    end
  end
end
