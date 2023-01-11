User.find_or_create_by(email: "admin@triggy.com", user_type: AppConstant::ADMIN) do |t|
	t.password = "Password1!"
	t.password_confirmation = "Password1!"
	t.first_name = "Twiggy"
	t.last_name = "Admin"
	t.phone_number = "044-22515455"
end