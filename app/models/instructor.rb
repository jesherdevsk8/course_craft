class Instructor < ApplicationRecord
  has_secure_password

  # Instructor.second.enrollments.map(&:course)
  has_many :enrollments, as: :enrollable
end
