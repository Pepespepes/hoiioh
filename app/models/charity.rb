class Charity < ApplicationRecord
  CATEGORIES = %w[Animal Human\ Services Children Health Education Environment]

  belongs_to :user
  has_many :messages
  has_many :invitations
  has_many :events

  validates :charity_name, :category, :description, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
