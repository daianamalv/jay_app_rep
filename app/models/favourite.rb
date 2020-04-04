class Favourite < ApplicationRecord
  belongs_to :guide
  belongs_to :tour
end
