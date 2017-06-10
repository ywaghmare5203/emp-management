class AddTypeToSpouses < ActiveRecord::Migration
  def change
  	add_column :spouses, :type, :string
  	remove_column :reports, :employees_id
  	add_reference :reports, :employee, index: true
  	add_foreign_key :reports, :employees
  	remove_column :trade_careers, :employees_id
  	add_reference :trade_careers, :employee
  	add_foreign_key :trade_careers, :employees
  	add_foreign_key :spouses, :employees
  	add_foreign_key :qualifications, :employees
  	remove_column :roles, :employee_id
  	remove_column :employees, :role_id
  	add_foreign_key :phones, :employees
  	add_foreign_key :notes, :employees
  	add_foreign_key :next_of_kins, :employees
  	add_foreign_key :competencies, :employees
  	add_foreign_key :addresses, :employees

  end
end
