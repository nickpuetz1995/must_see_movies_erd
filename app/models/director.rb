class Director < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :crews,
             dependent: :destroy

  # Indirect associations

  has_many   :movies,
             through: :crews,
             source: :movie

  # Validations

  # Scopes

  def to_s
    name
  end
end
