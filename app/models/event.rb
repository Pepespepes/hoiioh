class Event < ApplicationRecord
  belongs_to :charity

  has_many :bookings

  validates :address, :date, :start_time, :duration, :description, :number_positions, presence: true
  validates :duration, inclusion: { in: (1..8) }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
