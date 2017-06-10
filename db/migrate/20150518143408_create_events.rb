class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :employee, foreign_key: true
      t.string :type
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :away

      t.timestamps null: false
    end
  end
end
