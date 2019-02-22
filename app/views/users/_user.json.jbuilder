json.extract! user, :id, :email, :name, :password, :phone, :contactmethod, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
