class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price, :order_id

  validates :name, :presence => true
  validates :price, :presence => true
end
