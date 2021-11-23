class Message < ApplicationRecord
  belongs_to :charity
  belongs_to :chatroom
  belongs_to :volunteer

  validates :content, presence: true
end
