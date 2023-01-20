class SubIngredient < ApplicationRecord
	self.table_name = "ingredients"
	default_scope {where.not(ingredient_id: nil)}
	belongs_to :ingredient
end
