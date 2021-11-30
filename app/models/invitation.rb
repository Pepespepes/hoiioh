class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :inviter, class_name: "User"
  belongs_to :chatroom
end
