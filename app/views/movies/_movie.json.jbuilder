json.extract! movie, :id, :name, :image, :bio, :year, :duration, :created_at,
              :updated_at
json.url movie_url(movie, format: :json)
