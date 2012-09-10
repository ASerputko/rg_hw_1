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

  describe 'should retrieve a list of customers who ordered 2 or more items in the last 90 days' do
    it 'should be valid with 2 items' do
      order = Order.new(:user_id => @user.id)
      2.times { |n| order.items << Item.create(:name => "Item_#{n}_#{Time.now}", :price => 100.00)}
      order.save

      User.loyality.count.should == 1
    end

    it 'should be valid with 100 items' do
      order = Order.new(:user_id => @user.id)
      100.times { |n| order.items << Item.create(:name => "Item_#{n}_#{Time.now}", :price => 100.00)}
      order.save

      User.loyality.count.should == 1
    end

    it 'should not be valid with 1 item' do
      order = Order.new(:user_id => @user.id)
      1.times { |n| order.items << Item.create(:name => "Item_#{n}_#{Time.now}", :price => 100.00)}
      order.save

      User.loyality.count.should_not == 1
    end

    it 'should not be valid with items that were bought more than 90 days ago' do
      order = Order.new(:user_id => @user.id)
      100.times { |n| order.items << Item.create(:name => "Item_#{n}_#{Time.now}", :price => 100.00)}
      order.created_at = Time.current - 90.days
      order.save
      
      User.loyality.count.should_not == 1
    end
  end
end
