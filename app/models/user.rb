class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  enum type: [
    :Doctor,
    :Patient
  ]

  def full_name
    "#{first_name} #{last_name}"
  end
end
