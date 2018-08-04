class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessor :terms_of_service
  validates :terms_of_service, acceptance: true
  has_many :cars
  
  has_many :comment_files, dependent: :destroy
  accepts_nested_attributes_for :comment_files, reject_if: :all_blank, allow_destroy: true
  
  has_many :violations, dependent: :destroy
  
  has_attached_file :profile_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/missing.png"
  validates_attachment_content_type :profile_image, content_type: /\Aimage\/.*\z/
  
  def make_admin
    self.update!(admin: true)
  end
  
  def name
    [self.firstname,self.lastname].join(" ")
  end
  
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0,20]
  #     user.linkedin_link = auth.info.urls.public_profile if auth.provider=="linkedin"
  #     user.name = auth.info.name   # assuming the user model has a name
  #     # user.image = auth.info.image # assuming the user model has an image
  #     # If you are using confirmable and the provider(s) you use validate emails, 
  #     # uncomment the line below to skip the confirmation emails.
  #     user.skip_confirmation!
  # end
# end
end
