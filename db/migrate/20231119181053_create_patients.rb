class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.integer :age
      t.string :insurance
      t.string :emoji_avatar
      t.boolean :cured, default: false

      t.timestamps
    end
  end
end
