class CreateRestaurantIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :unit
      t.integer :ingredient_id
      t.float :quantity

      t.timestamps
    end
  end
end
