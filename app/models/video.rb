class Video < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_one_attached :movie
  
  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  validates :content, presence: true
  
  def get_movie
    if movie.attached?
      movie
    else
      'no_image.jpg'
    end
  end
  
end
