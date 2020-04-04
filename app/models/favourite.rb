class Favourite < ApplicationRecord
  belongs_to :guide
  belongs_to :tour
  validates_uniqueness_of :guide_id, :scope => [:tour_id]
end
