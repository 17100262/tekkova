class CarPicture < ApplicationRecord
  belongs_to :car
  # has_one_attached :car_image
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
