# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Email confirmation
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 465,
  doman: 'gmail.com',
  user_name: 'alexsesay91@gmail.com',
  password: 'Muhammad@010',
  authentication: 'plain',
  :ssl => true,
  :tsl => true,
  enable_starttls_auto: true
}
