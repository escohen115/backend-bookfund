class CreateWaitings < ActiveRecord::Migration[6.1]
  def change
    create_table :waitings do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :sponsor_id
      t.boolean :fulfilled
      t.boolean :reviewed

      t.timestamps
    end
  end
end
