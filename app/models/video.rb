class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :movie
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  
end
