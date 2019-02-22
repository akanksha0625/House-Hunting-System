json.extract! house, :id, :location, :square_footage, :year_built, :style, :list_price, :no_of_floors, :basement, :current_house_owner, :contact_info, :potential_buyers, :created_at, :updated_at
json.url house_url(house, format: :json)
