class Booking < ApplicationRecord
  belongs_to :event
  belongs_to :volunteer
end
