require 'spec_helper'

describe User do
  before(:each) do
    @user = User.create(:name => 'Name', :email => 'name@gmail.com')
  end

  it 'should be valid' do
    @user.should be_valid
  end

  it 'should not be valid without name' do
  	@user.name = ''
  	@user.should_not be_valid
  end

  it 'should not be valid without email' do
  	@user.email = ''
  	@user.should_not be_valid
  end

  it 'should find all the items they bought' do
  	order = Order.new
  	5.times { |n| order.items << Item.create(:name => "Item_#{n}_#{Time.now}", :price => 100.00)}
  	@user.orders << order
  	@user.items.count.should == 5
  end
end
