class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :menu_code
      t.integer :restaurant_id
      t.integer :category_id
      t.string :image_url
      t.integer :price
      t.string :description
      t.timestamps
    end
  end
end
