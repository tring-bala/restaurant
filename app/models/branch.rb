class Branch < ApplicationRecord
 
  belongs_to :restaurant, foreign_key: :restaurant_id
  has_one :address, as: :addressable, dependent: :destroy
end
