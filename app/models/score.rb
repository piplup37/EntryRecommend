class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  
  def self.risyuzumi?(sub,user)
    return true if where(:user_id => user,:subject_id => sub).exists?
  end

end
