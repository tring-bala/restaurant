class Ingredient < ApplicationRecord
	default_scope {where(ingredient_id: nil)}
	has_many :sub_ingredients, dependent: :destroy
	accepts_nested_attributes_for :sub_ingredients, reject_if: :all_blank, allow_destroy: true
end
