json.extract! director, :id, :name, :dob, :bio, :image, :number_of_films,
              :created_at, :updated_at
json.url director_url(director, format: :json)
