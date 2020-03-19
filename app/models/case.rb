class Case < ApplicationRecord
  belongs_to :patient, class_name: "User", foreign_key: "patient_id"
  belongs_to :doctor, class_name: "User", foreign_key: "doctor_id"

  scope :active, -> { where(status: 'active') }
  scope :closed, -> { where(status: 'closed') }
end
