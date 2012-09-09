require 'spec_helper'

describe Item do
  before(:each) do
    @item = Item.new(:name => 'Name', :description => 'Description', :price => 100.00)
  end

  it 'should be valid' do
    @item.should be_valid
  end

  it 'should not be valid without name' do
  	@item.name = ''
  	@item.should_not be_valid
  end

  it 'should not be valid without price' do
  	@item.price = ''
  	@item.should_not be_valid
  end

  it 'should be valid without description' do
  	@item.description = ''
  	@item.should be_valid
  end
end
