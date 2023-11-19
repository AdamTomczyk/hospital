class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.boolean :availability
      t.string :specality
      t.string :experience

      t.timestamps
    end
  end
end
