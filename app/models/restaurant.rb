class Restaurant < ApplicationRecord
	validates_presence_of :name, :number, :contact_person, :email, :contact_number
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
	has_many :branches, dependent: :destroy
	has_many :menus, dependent: :destroy
	belongs_to :owner, class_name: "User", foreign_key: :owner_id
	accepts_nested_attributes_for :branches, :owner, reject_if: :all_blank, allow_destroy: true

	before_validation :create_owner, on: :create
	before_destroy :delete_owner

	def delete_owner
		owner.destroy
	end

	def create_owner
		self.owner_attributes = {first_name: name, last_name: "Admin", email: email, password: "password", password_confirmation: "password", user_type: AppConstant::RESTAURANT}
	end
end
