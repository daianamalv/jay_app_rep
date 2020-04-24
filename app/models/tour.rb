class Tour < ApplicationRecord
  has_many :places
  belongs_to :city, optional: true
  belongs_to :guide, optional: true
  has_one_attached :image
  has_many :favourites
  has_many :favourite_guides, through: :favourites
  mount_uploader :cover, TourCoverUploader
end
