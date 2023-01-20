class Branch < ApplicationRecord
  belongs_to :restaurant
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address, reject_if: :all_blank, allow_destroy: true

end
