class CreateJoinTableEmployeeEvent < ActiveRecord::Migration
  def change
    create_join_table :employees, :events, table_name: :participants do |t|
      # t.index [:employee_id, :event_id]
      # t.index [:event_id, :employee_id]
    end
  end
end
