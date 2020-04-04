class Place < ApplicationRecord
  belongs_to :guide, optional: true
  belongs_to :point, optional: true
  belongs_to :tour, optional: true
  has_one_attached :image

end
