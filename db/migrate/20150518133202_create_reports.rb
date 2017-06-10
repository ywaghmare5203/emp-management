class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.date :previous_date
      t.date :next_date
      t.boolean :mpar
      t.date :mpar_date
      t.references :employees, index: true, foreign_key:true

      t.timestamps null: false
    end
  end
end
