class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price, :order_id

  validates :name, :presence => true
  validates :price, :presence => true

  # TODO: not implemented yet. This is quick solution. 
  def self.top
  	top_items = []
  	Order.all.each { |order| order.items.each { |item| top_items << item.name }}
  	top_items.uniq
  end
end
