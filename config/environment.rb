# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
School::Application.initialize!

ActionMailer::Base.smtp_settings = {
    :port =>           '587',
    :address =>        'smtp.mandrillapp.com',
    :user_name =>      'jai.n@cisinlabs.com',
    :password =>       'z2YjLCdx5HyICTbaTnzaBA',
    :domain =>         'heroku.com',
    :authentication => :plain
}
ActionMailer::Base.delivery_method = :smtp