# coding: utf-8

class Subject < ActiveRecord::Base
  has_many :scores, :dependent => :destroy
  has_many :entries
  has_many :users, :through => :scores
  has_and_belongs_to_many :categs, :uniq => true
  has_many :curriculums, :through => :subjects
  
  scope :zenki,where(:part => '前期')
  scope :kouki,where(:part => '後期')
  scope :sougouA,where(:kubun => '総合A群')
  scope :sougouB,where(:kubun => '総合B群')
  scope :sougouC,where(:kubun => '総合C群')
  scope :kisosen,where(:kubun => '基礎専門')
  scope :senmon,where(:kubun => '専門')
  scope :hissyu,where(:ip_comp => '必修')
  scope :senhitsu,where(:ip_comp => '選択必修')
  scope :sentaku,where(:ip_comp => '選択')
  scope :jigen,lambda {|p| where 'period = ?',p}

  def risyuritsu(userlank)
    ninzu = self.users.where('lank > ? AND role_id = ?',userlank,925085493).size.to_f
    all = User.where('lank > ? AND role_id = ?',userlank,925085493).size.to_f
    p = ninzu/all*100.0
    if p.nil?
      return 0
    else
      return p.round
    end
  end
end
