Rails.application.config.middleware.use OmniAuth::Builder do
    # provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
    provider :google_oauth2, '451426513295-otp86qpdv3nulgkjv2bleiurgi2rdoef.apps.googleusercontent.com','z4aFh37IpZP6Ar9xSIxEMe0e'
    # provider :facebook, '1840306979332866', '664e1354f156e8e5b4545e1429d0cfb9'

    configure do |config|
      config.path_prefix = '/users/auth'
    end
end