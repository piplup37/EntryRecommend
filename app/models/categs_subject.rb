class CategsSubject < ActiveRecord::Base
  belongs_to :categ
  belongs_to :subject
  validates_uniqueness_of :categ, :scope => :subject
end
