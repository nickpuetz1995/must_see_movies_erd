class Crew < ApplicationRecord
  # Direct associations

  belongs_to :director

  belongs_to :movie

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    movie.to_s
  end
end
