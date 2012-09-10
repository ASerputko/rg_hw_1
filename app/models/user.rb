class User < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :orders
  has_many :items, :through => :orders

  validates :name, :presence => true
  validates :email, :presence => true

  def self.loyality
    self.all.select do |user|    	
    	items = user.orders.map { |order| order.items if order.created_at >= Time.current - 90.days }
    	user if items.first.size >= 2 unless items.first.nil?
    end
  end
end
