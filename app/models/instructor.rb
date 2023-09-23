class Instructor < ApplicationRecord
  has_secure_password

  normalizes :email, with: ->(email) { email.strip.downcase }

  # Instructor.second.enrollments.map(&:course)
  has_many :enrollments, as: :enrollable

  validates :name, :email, presence: true
  validates :password_digest, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true,
                    format: { with: /\A^[a-z0-9._-]+@[a-z0-9]+\.[a-z]{2,3}+(\.[a-z]{2,3})?(\.[a-z]{2})?\z/,
                              message: 'must be a valid email address' }
end
