require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new(:name => 'Name', :email => 'name@gmail.com')
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
end
