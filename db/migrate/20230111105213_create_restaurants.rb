class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :number
      t.string :website
      t.string :contact_person
      t.string :contact_number
      t.string :email
      t.integer :owner_id

      t.timestamps
    end
  end
end
