class Volunteer < ApplicationRecord
  belongs_to :employer, optional: true
  belongs_to :user
  has_many :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :description, presence: true

end
