class CreateResponsibilities < ActiveRecord::Migration
  def change
    create_table :responsibilities do |t|
      t.references :employee, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
