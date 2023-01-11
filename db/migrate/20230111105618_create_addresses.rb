class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :addressable_type
      t.integer :addressable_id
      t.string :building_number
      t.string :street
      t.string :locality
      t.string :address_line1
      t.string :address_line2
      t.string :landmark
      t.string :city
      t.string :state
      t.string :pincode
      t.string :phone_number
      t.string :mobile_number
      t.string :email
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
