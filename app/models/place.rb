class Place < ApplicationRecord
  belongs_to :guide, optional: true
  belongs_to :user, optional: true
  belongs_to :point, optional: true
  belongs_to :tour, optional: true
  # has_one_attached :image
  has_many :place_images
  mount_uploader :cover, PlaceCoverUploader


end
