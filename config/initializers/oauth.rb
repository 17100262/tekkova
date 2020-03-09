Rails.application.config.middleware.use OmniAuth::Builder do
    # provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'],ENV['GOOGLE_CLIENT_SECRET']
    provider :facebook, ENV['FACEBOOK_CLIENT_ID'],ENV['FACEBOOK_CLIENT_SECRET']
    # provider :facebook, '1840306979332866', '664e1354f156e8e5b4545e1429d0cfb9'

    configure do |config|
      config.path_prefix = '/users/auth'
    end
end