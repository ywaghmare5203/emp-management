class AddRoleToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :role_id, :integer
  end
  
  def self.update
    add_index :employees, :role_id
  end

  def self.down
    remove_index :employees, :role_id
  end
end

