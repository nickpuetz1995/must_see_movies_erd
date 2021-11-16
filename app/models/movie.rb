class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :bookmarks,
             dependent: :destroy

  has_many   :reviews,
             dependent: :destroy

  has_many   :crews,
             dependent: :destroy

  has_many   :casts,
             dependent: :destroy

  # Indirect associations

  has_many   :actors,
             through: :casts,
             source: :actor

  has_many   :directors,
             through: :crews,
             source: :director

  # Validations

  # Scopes

  def to_s
    name
  end
end
