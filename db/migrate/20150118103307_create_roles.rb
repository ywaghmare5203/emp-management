class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :employee_id
      t.string :PID
      t.string :description
      t.string :ancestry
      t.string :section

      t.timestamps null: false
    end
    add_index :roles, :ancestry
    add_index :roles, :employee_id
  end
end
