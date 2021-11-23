class Employer < ApplicationRecord
  belongs_to :user
  has_many :volunteers

  validates :company_name, presence: true
end
