class CreateMedicalRecords < ActiveRecord::Migration
  def change
    create_table :medical_records do |t|
      t.references :employee

      t.timestamps null: false
    end
  end
end
