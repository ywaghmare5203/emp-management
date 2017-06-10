class CreateTradeCareers < ActiveRecord::Migration
  def change
    create_table :trade_careers do |t|
      t.date :paab_complete
      t.string :paab_result
      t.date :next_paab
      t.boolean :tiffy_maths_req
      t.boolean :tiffy_maths_complete
      t.date :class_2
      t.date :class_1
      t.date :artificer
      t.references :employees, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
