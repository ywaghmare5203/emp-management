class CreateNextOfKins < ActiveRecord::Migration
  def change
    create_table :next_of_kins do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :contact_number
      t.string :relation

      t.timestamps null: false
    end
  end
end
