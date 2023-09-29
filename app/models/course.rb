class Course < ApplicationRecord
  has_many :enrollments
  has_many :instructors, through: :enrollments, source: :enrollable, source_type: 'Instructor'
  has_many :students, through: :enrollments, source: :enrollable, source_type: 'Student'
  has_many :semester, through: :enrollments, source: :enrollable, source_type: 'Semester'
  has_many :teaching_level, through: :enrollments, source: :enrollable, source_type: 'TeachingLevel'

  scope :students_names, lambda { |params|
    params.each do |course|
      @result = {
        course_name: course,
        student_names: course.students.map(&:name),
        current_semester: course.semester.map(&:current_semester),
        description: course.semester.map(&:description),
        total_per_course: course.students.count
      }
    end

    @result
  }

  scope :instructors_names, lambda { |params|
    params.each do |course|
      @result = {
        course_name: course,
        instructors_names: course.instructors.map(&:name),
        current_semester: course.semester.map(&:current_semester),
        description: course.semester.map(&:description),
        total_per_course: course.instructors.count
      }
    end

    @result
  }
end
