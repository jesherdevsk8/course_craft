class Student < ApplicationRecord
  has_secure_password

  has_many :enrollments, as: :enrollable
end
