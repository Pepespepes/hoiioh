class Chatroom < ApplicationRecord
  has_many :messages
  has_many :invitations
end
