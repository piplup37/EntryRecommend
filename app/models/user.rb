class User < ActiveRecord::Base
  has_many :scores
  has_many :entries
  has_many :subjects, :through => :scores
  belongs_to :role
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :friend_requests
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_id, :no, :user_name, :cource, :lank
end
