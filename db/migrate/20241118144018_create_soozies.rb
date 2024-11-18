class CreateSoozies < ActiveRecord::Migration[7.1]
  def change
    create_table :soozies do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :gender
      t.string :address
      t.boolean :available
      t.integer :price
      t.date :birthdate
      t.string :hair_color
      t.string :eye_color
      t.integer :height
      t.integer :weight
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
