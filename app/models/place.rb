class Place < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :point, optional: true
  belongs_to :tour, optional: true
  has_one_attached :image

end
