class Volunteer < ApplicationRecord
  belongs_to :employer, optional: true
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :description, presence: true

end
