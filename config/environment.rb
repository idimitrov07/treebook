# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Treebook::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'app18140881@heroku.com',
  :password => '444cl1r9',
  :domain => 'heroku.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

#config.action_mailer.delivery_method = :smtp