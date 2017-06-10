class AddEmployeeAndRoleToAssignment < ActiveRecord::Migration
  def change
    add_index :assignments, :employee_id
    add_foreign_key :assignments, :employees
    add_index :assignments, :role_id
    add_foreign_key :assignments, :roles
  end
end
