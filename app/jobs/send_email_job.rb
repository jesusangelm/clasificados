class SendEmailJob < ActiveJob::Base
  include Sidekiq::Worker
  queue_as :default

  def perform(classified, user)
    NotificationMailer.keyword_found(classified, user).deliver_later(wait: 1.minute)
  end
end
