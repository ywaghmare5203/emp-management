class AddDetailsToMed < ActiveRecord::Migration
  def change
  	add_column :medical_records, :pstat, :integer
  	add_column :medical_records, :deployability, :string
  	add_column :medical_records, :hep_a, :date
  	add_column :medical_records, :hep_a_next, :date
  	add_column :medical_records, :hep_b, :date
  	add_column :medical_records, :hep_b_next, :date
  	add_column :medical_records, :diptheria, :date
  	add_column :medical_records, :diptheria_next, :date
  	add_column :medical_records, :polio, :date
  	add_column :medical_records, :polio_next, :date
  	add_column :medical_records, :tetanus, :date
  	add_column :medical_records, :tetanus_next, :date
  	add_column :medical_records, :typhoid, :date
  	add_column :medical_records, :typhoid_next, :date
  	add_column :medical_records, :yellow_fever, :date
  	add_column :medical_records, :yellow_fever_next, :date
  	add_column :medical_records, :mmr, :date
  	add_column :medical_records, :mmr_next, :date
  	add_column :medical_records, :audio, :date
  	add_column :medical_records, :audio_next, :date
  	add_column :medical_records, :blood_group, :string
  	add_column :medical_records, :nato_cat, :integer
  	add_column :medical_records, :dental_next, :date
  	add_column :medical_records, :notes, :text
  	add_index :medical_records, :employee_id
  	add_foreign_key :medical_records, :employees
  end
end
