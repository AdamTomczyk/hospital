class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :emoji_avatar
      t.boolean :available
      t.string :speciality
      t.integer :experience

      t.timestamps
    end
  end
end
