# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    post: 587,
    domain: 'example.com',
    user_name: 'work.website.adm1n@gmail.com',
    password:  'work1111',
    authentication:       'plain',
    enable_starttls_auto: true  
  }
end
ActionMailer::Base.default :content_type => "text/html"