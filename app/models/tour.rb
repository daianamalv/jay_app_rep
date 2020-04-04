class Tour < ApplicationRecord
  has_many :places
  belongs_to :city, optional: true
  belongs_to :guide, optional: true
  has_one_attached :image
  has_many :favourites
  mount_uploader :avatar_link, TourCoverUploader
end
