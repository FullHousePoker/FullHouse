class User < ActiveRecord::Base
  has_many :games

  validates_presence_of :email, :last_name
  validates_uniqueness_of :email
end
