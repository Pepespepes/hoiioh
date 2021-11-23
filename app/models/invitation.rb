class Invitation < ApplicationRecord
  belongs_to :charity
  belongs_to :volunteer
  belongs_to :chatroom
end
