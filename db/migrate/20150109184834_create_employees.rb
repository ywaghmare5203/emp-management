class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :service_no
      t.date :date_of_birth
      t.string :gender
      t.date :service_start_date
      t.string :substantive_rank
      t.date :promotion_date
      t.string :passport_number
      t.date :passport_expiry
      t.string :passport_country_of_origin
      t.string :nationality
      t.string :national_insurance

      t.timestamps null: false
    end
  end
end
