class Order < ActiveRecord::Base
	attr_accessible :user_id

  belongs_to :user
  has_many :items

  validates :user_id, :presence => true 
  validates :items, :presence => true

  scope :recent, lambda {where('created_at <= ?', Time.current - 90.days)}
end
