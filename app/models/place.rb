class Place < ApplicationRecord
  has_one_attached :place_image
  
  def get_image
    if place_image.attached?
      place_image
    else
      'no_image.jpg'
    end
  end
end
