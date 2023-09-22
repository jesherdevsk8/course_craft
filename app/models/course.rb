class Course < ApplicationRecord
  has_many :enrollments
  has_many :instructors, through: :enrollments, source: :enrollable, source_type: 'Instructor'
  has_many :students, through: :enrollments, source: :enrollable, source_type: 'Student'
  has_many :semester, through: :enrollments, source: :enrollable, source_type: 'Semester'
  has_many :teaching_level, through: :enrollments, source: :enrollable, source_type: 'TeachingLevel'
end
