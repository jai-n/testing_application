# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
School::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'jai.n@cisinlabs.com',
  :password => 'download123',
  :domain => 'example.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}