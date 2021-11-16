class MovieResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :image, :string
  attribute :bio, :string
  attribute :year, :integer
  attribute :duration, :integer

  # Direct associations

  has_many   :bookmarks

  has_many   :reviews

  has_many   :crews

  has_many   :casts

  # Indirect associations

  many_to_many :actors

  many_to_many :directors
end
