class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :subtitle
      t.string :authors
      t.string :publisher
      t.string :publishedDate
      t.string :description
      t.string :image_url
      t.string :api_id

      t.timestamps
    end
  end
end
