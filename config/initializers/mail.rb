ActionMailer::Base.smtp_settings = {
  address: ENV["SMTP_HOST_ADDRESS"],
  port: ENV["SMTP_HOST_PORT"],
  enable_starttls_auto: true,
  user_name: ENV["SMTP_USERNAME"],
  password: ENV["SMTP_PASSWORD"],
  authentication: :login
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"
