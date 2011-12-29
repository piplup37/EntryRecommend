class Categ < ActiveRecord::Base
	has_and_belongs_to_many :subjects, :uniq => true

end
