class Classified < ActiveRecord::Base
  validates :content, uniqueness: true
end
