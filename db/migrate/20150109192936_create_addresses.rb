class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :type
      t.string :street_address
      t.string :street_address_2
      t.string :town
      t.string :county
      t.string :country
      t.string :post_code

      t.timestamps null: false
    end
  end
end
