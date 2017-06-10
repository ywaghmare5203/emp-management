class AddEmployeeIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :employee_id, :integer
    add_column :phones, :employee_id, :integer
    add_column :next_of_kins, :employee_id, :integer
    add_column :competencies, :employee_id, :integer
    add_column :qualifications, :employee_id, :integer
    
    add_index :addresses, :employee_id
    add_index :phones, :employee_id
    add_index :next_of_kins, :employee_id
    add_index :competencies, :employee_id
    add_index :qualifications, :employee_id
  end
end
