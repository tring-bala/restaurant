json.extract! restaurant, :id, :name, :number, :website, :contact_person, :contact_number, :email, :owner_id, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
