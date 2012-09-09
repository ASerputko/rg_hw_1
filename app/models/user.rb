class User < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :orders
  has_many :items, :through => :orders

  validates :name, :presence => true
  validates :email, :presence => true
end
