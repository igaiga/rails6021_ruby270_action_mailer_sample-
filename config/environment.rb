# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
  ActionMailer::Base.smtp_settings = {
    user_name: Rails.application.credentials.smtp_user_name,
    password: Rails.application.credentials.smtp_password,
    domain: Rails.application.credentials.smtp_from_domain,
    address: 'smtp.sendgrid.net',
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true
  }
end
