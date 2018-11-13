Devise.setup do |config|
config.secret_key = '77c78c2181dfe988740b5030d2de29e925eaf7fd836f8571f2bd19ad0a8b7d2fc6f6f0a6a28d1dabcbe84f46aac3822229d5d68a0832c9914eae8aee7760817a'
  config.mailer_sender = 'support@tekkova.com'
  config.mailer = 'Devise::Mailer'
  config.parent_mailer = 'ActionMailer::Base'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = false
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.lock_strategy = :failed_attempts
  config.unlock_keys = [:email]
  config.unlock_strategy = :both
  config.maximum_attempts = 4
  config.unlock_in = 1.hour
  config.last_attempt_warning = true
  config.reset_password_within = 6.hours
  config.scoped_views = true
  config.sign_out_via = :delete
  config.omniauth :facebook, Rails.application.secrets['fb_access_id'], Rails.application.secrets['fb_secret_id']
  config.omniauth :linkedin, Rails.application.secrets['linkedin_access_id'], Rails.application.secrets['linkedin_secret_id']
  config.omniauth :twitter , Rails.application.secrets['twitter_access_id'], Rails.application.secrets['twitter_secret_id']
  config.omniauth :google_oauth2, Rails.application.secrets['google_access_id'], Rails.application.secrets['google_secret_id']
end
