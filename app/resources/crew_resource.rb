class CrewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :movie_id, :integer
  attribute :director_id, :integer

  # Direct associations

  belongs_to :director

  belongs_to :movie

  # Indirect associations
end
