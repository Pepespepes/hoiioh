class Volunteer < ApplicationRecord
  belongs_to :employer
  belongs_to :user
end
