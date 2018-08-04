module Bulky
  class ApplicationMailer < ActionMailer::Base
    default from: 'support@tekkova.com'
    layout 'mailer'
  end
end
