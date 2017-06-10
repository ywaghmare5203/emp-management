class ChangeRoleColumnName < ActiveRecord::Migration
  def change
  	rename_column :roles, :PID, :pid
  end
end
