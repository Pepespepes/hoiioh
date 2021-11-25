class Charity < ApplicationRecord
  CATEGORIES = %w[Human\ Welfare Animal\ Welfare Environment Sports Charity\ Shops]

  belongs_to :user
  has_many :messages
  has_many :invitations
  has_many :events

  validates :charity_name, :category, :description, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
