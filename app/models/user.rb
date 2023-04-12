class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
  has_one_attached :profile_image
  
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/person.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.valiant(resize_to_limit: [100, 100]).processed
  end
end
