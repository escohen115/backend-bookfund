class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :bio
      t.string :profile_pic
      t.string :password_digest
      t.boolean :two_weeks

      t.timestamps
    end
  end
end
