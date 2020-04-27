class Favourite < ApplicationRecord
  # belongs_to :guide
  belongs_to :user, optional: true
  belongs_to :tour
  # validates_uniqueness_of :guide_id, :scope => [:tour_id]
  validates_uniqueness_of :user_id, :scope => [:tour_id]
end
