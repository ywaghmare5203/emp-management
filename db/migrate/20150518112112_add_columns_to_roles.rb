class AddColumnsToRoles < ActiveRecord::Migration
  def change
  	add_column :roles, :regt_corps, :string
  	add_column :roles, :rank, :string
  	add_column :roles, :main_and_alt_trade, :string
  	add_column :roles, :remarks, :string
  end
end
