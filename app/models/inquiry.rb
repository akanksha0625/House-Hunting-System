class Inquiry < ApplicationRecord
  belongs_to :house
  belongs_to :user
  has_many :replies
  validates :message_content, presence: true
end
