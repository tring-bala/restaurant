class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.references :restaurant, foreign_key: true
      t.boolean :is_head_branch
      t.string :name
      t.string :number
      t.string :contact_person
      t.string :contact_name
      t.string :email
      t.integer :owner_id

      t.timestamps
    end
  end
end
