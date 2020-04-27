class Guide < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :places
  has_many :tours
  # has_many :favourites
  # has_many :favourite_tours, through: :favourites, source: 'tour'
  mount_uploader :avatar, GuideAvatarUploader

end
