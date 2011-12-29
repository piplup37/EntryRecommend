class Curriculum < ActiveRecord::Base
  belongs_to :user
  has_many :curriculums_subjects
  has_many :subjects, :through => :curriculums_subjects
end
