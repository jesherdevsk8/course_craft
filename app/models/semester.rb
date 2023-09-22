class Semester < ApplicationRecord
  has_many :enrollments, as: :enrollable
end
