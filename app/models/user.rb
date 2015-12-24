class User < ActiveRecord::Base
  has_many :games

  validates_presence_of :username, :password, :first_name, :last_name
  validates_uniqueness_of :username
end
