class AddIndexToEmployeesServiceNo < ActiveRecord::Migration
  def change
    add_index :employees, :service_no, unique: true
  end
end
