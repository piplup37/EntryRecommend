class SubjectsTeacher < ActiveRecord::Base
  belongs_to :subject
  belongs_to :teacher
  validates_uniqueness_of :subject_id, :scope => [:teacher_id]
end
