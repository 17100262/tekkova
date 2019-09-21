Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true
  config.read_encrypted_secrets = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Use a different logger for distributed setups.
  # require 'syslog/logger'
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end
  config.active_record.dump_schema_after_migration = false
  config.action_mailer.default_url_options = { host: 'https://tekkova.herokuapp.com' }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  
  
  ActionMailer::Base.delivery_method = :smtp
  # ActionMailer::Base.smtp_settings = {
  #   :address => 'smtpout.secureserver.net',
  #   :domain  => 'www.guidistan.com',
  #   :port      => 80,
  #   :user_name => 'guidistan@guidistan.com',
  #   :password => 'admin123',
  #   :authentication => 'plain'
  #   }
  ActionMailer::Base.smtp_settings = {
    :address => 'smtp.mailgun.org',
    :domain  => ENV['mailer_domain'],
    :port      => 587,
    :user_name => ENV['mailer_username'],
    :password => ENV['mailer_password'],
    :authentication => :plain
    }
  

  # ActionMailer::Base.smtp_settings = {
  #   :address => "smtp.mailgun.org",
  #   :domain  => ENV["MAIL_DOMAIN"],
  #   :port      => 587,
  #   :user_name => ENV["MAIL_USERNAME"],
  #   :password => ENV["MAIL_PASSWORD"],
  #   :authentication => 'plain'
  #   }

  config.paperclip_defaults = {
    storage: :s3,
    s3_credentials: {
      bucket: ENV['S3_BUCKET_NAME'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      s3_region: ENV['AWS_REGION'],
    }
  }
end
