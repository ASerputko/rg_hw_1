class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price

  validates :name, :presence => true
  validates :price, :presence => true
end
