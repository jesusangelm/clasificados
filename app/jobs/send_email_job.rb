class SendEmailJob < ActiveJob::Base
  include SuckerPunch::Job
  queue_as :default

  def perform(classified, user)
    NotificationMailer.keyword_found(classified, user).deliver_later
  end
end
