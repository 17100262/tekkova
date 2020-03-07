class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :terms_of_service, :step
  validates :terms_of_service, acceptance: true

  has_many :cars, dependent: :destroy

  has_many :comment_files, dependent: :destroy
  accepts_nested_attributes_for :comment_files, reject_if: :all_blank,
                                                allow_destroy: true

  has_many :violations, dependent: :destroy
  has_many :documents, class_name: 'UserDocument', dependent: :destroy
  has_attached_file :profile_image, styles: { medium: '300x300>',
                                              thumb: '100x100>' },
                                    default_url: '/missing.png'
  validates_attachment_content_type :profile_image,
                                    content_type: %r{\Aimage/.*\z}

  has_attached_file :licensefront, styles: { medium: '300x300>',
                                             thumb: '100x100>' }
  validates_attachment_content_type :licensefront,
                                    content_type: %r{\Aimage/.*\z}

  has_attached_file :licenseback, styles: { medium: '300x300>',
                                            thumb: '100x100>' }
  validates_attachment_content_type :licenseback,
                                    content_type: %r{\Aimage/.*\z}

  # after_create_commit { BasicMailer.welcome_email(self).deliver_later }

  enum research: [:yes,:no,:skip]

  def make_admin
    update!(admin: true)
  end

  def name
    [firstname, lastname].join(' ')
  end

  def deleted_account; end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.firstname = auth.info.name
      # user.profile_picture = open(process_uri(auth.info.image))
      user.password = Devise.friendly_token[0, 20]
    end
  end

  # end
  # instead of deleting, indicate the user requested a delete & timestamp it
  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  # ensure user account is active
  def active_for_authentication?
    super && !deleted_at
  end

  # provide a custom message for a deleted account
  def inactive_message
    !deleted_at ? super : :deleted_account
  end
end
