class Restaurant < ApplicationRecord
	validates_presence_of :name, :number, :contact_person, :email, :contact_number
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
	has_many :branches, dependent: :destroy

	before_create :create_user

	def create_user
		firstName = self.name.split(" ")[0]
		saveUser = User.create({:email => self.email, :password => self.email, :first_name => firstName, :user_type => AppConstant::RESTAURANT})
		self.owner_id = saveUser.id
	end
	
end
