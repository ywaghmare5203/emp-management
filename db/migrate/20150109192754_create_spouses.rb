class CreateSpouses < ActiveRecord::Migration
  def change
    create_table :spouses do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :gender
      t.date :anniversary
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
