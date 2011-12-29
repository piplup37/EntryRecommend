class CurriculumsSubject < ActiveRecord::Base
  belongs_to :curriculum
  belongs_to :subject
end
