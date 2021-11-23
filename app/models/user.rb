class User < ApplicationRecord
  ROLES = %w[Volunteer Charity Employer]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :charity
  has_one :volunteer
  has_one :employer

  validates :current_role, presence: true
end
