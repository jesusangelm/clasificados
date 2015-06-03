# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  def keyword_found
    NotificationMailer.keyword_found(Classified.first, User.first)
  end

end
