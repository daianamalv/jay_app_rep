class City < ApplicationRecord
  has_many :tours
  mount_uploader :cover, CityCoverUploader

end
