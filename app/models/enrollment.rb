class Enrollment < ApplicationRecord
  belongs_to :enrollable, polymorphic: true
  belongs_to :course
end
