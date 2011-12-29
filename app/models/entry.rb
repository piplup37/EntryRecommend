class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  before_create "period_change(self.subject.period,self.user)"

  private
  def period_change(period,user)
    if Entry.where(:user_id => user).includes("subject").where(:subjects => {:period => period}).exists?
      Entry.where(:user_id => user).includes("subject").where(:subjects => {:period => period}).destroy_all
    end
  end
end
