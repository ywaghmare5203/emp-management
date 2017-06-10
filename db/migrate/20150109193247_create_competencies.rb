class CreateCompetencies < ActiveRecord::Migration
  def change
    create_table :competencies do |t|
      t.string :name
      t.string :type
      t.string :grade
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
