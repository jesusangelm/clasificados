class Classified < ActiveRecord::Base
  validates :content, uniqueness: true

  after_create :find_matched_keywords

  def find_matched_keywords
    User.all.each do |u|
      u.profile.keywords.scan(/[a-zA-Z\d]+/) do |k|
        if self[:content].include?(k)
          NotificationMailer.keyword_found(self, u).deliver_later
          break
        end
      end
    end
  end

end
