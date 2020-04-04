class Guide < ApplicationRecord
  has_many :places
  has_many :tours
  has_many :favourites
end
