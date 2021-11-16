class Actor < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :casts,
             dependent: :destroy

  # Indirect associations

  has_many   :movies,
             through: :casts,
             source: :movie

  # Validations

  # Scopes

  def to_s
    name
  end
end
