class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cases, foreign_key: "patient_id"

  scope :doctor, -> { where(user_type: 'doctor') }
  scope :patient, -> { where(user_type: 'patient') }

  def active_case
    cases.where(status: 'active').take
  end

  def has_active_case?
    active_case.present?
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
