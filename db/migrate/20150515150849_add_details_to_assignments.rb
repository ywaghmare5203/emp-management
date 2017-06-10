class AddDetailsToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :employee_id, :integer
    add_column :assignments, :role_id, :integer
    add_column :assignments, :start_date, :date
    add_column :assignments, :end_date, :date
    add_column :assignments, :assignment_id, :string
    add_column :assignments, :assignment_no, :integer
  end
end
