class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :comment
      t.date :date
      t.integer :employee_id

      t.timestamps null: false
    end
    add_index(:notes, :employee_id) 
  end
end
