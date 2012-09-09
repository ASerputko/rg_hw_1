require 'spec_helper'

describe Order do
  before(:each) do
    @order = Order.new
  end

  it 'should be valid' do
    @order.should_not be_valid
  end

  describe 'should have customer and at least one item' do
  	
  	
  	it 'should not be valid' do
  		@order.save
  		@order.should_not be_valid
  	end

  	it 'should not be valid without item' do
  		user = User.create(:name => 'Name', :email => 'name@gmail.com')
  		user.orders << @order
  		@order.should_not be_valid
  	end

  	it 'should not be valid without user' do
  		item = Item.create(:name => 'Name', :description => 'Description', :price => 100.00)
  		@order.items << item
  		@order.save
  		@order.should_not be_valid
  	end
  end
end
