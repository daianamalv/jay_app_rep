class User < ApplicationRecord
  has_many :places
  has_many :tours
  has_many :favourites
  has_many :favourite_tours, through: :favourites, source: 'tour'
  mount_uploader :cover, UserCoverUploader
end
