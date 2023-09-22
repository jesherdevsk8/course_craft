class TeachingLevel < ApplicationRecord
  has_many :enrollments, as: :enrollable
end
