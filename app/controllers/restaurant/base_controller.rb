class Restaurant::BaseController < BaseController
	helper_method :current_restaurant

	def current_restaurant
		Restaurant.find_by(owner_id: current_user.id)
	end
end