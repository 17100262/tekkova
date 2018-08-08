class CarPicture < ApplicationRecord
  belongs_to :car
  # has_one_attached :car_image
  attr_accessor :delete_picture
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  # after_validation { photo.clear if delete_photo == '1'  }
  
  
  def delete_photo
    avatar.clear if delete_picture == '1'
  end
  
  
end
