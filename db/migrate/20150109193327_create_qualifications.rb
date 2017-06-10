class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.string :type
      t.string :title
      t.string :grade
      t.date :end_date
      t.string :status
      t.string :school

      t.timestamps null: false
    end
  end
end
