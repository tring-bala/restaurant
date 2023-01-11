class Restaurant < ApplicationRecord
	validates_presence_of :name, :number, :contact_person, :email, :contact_number
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
	has_many :branches, dependent: :destroy
end
