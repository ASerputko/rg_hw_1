# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(:name => "Andrew Serputko", :email => "aserputko@gmail.com")

Item.create!(:name => "Item1", :price => 1)
Item.create!(:name => "Item2", :price => 2)
Item.create!(:name => "Item3", :price => 3)
Item.create!(:name => "Item4", :price => 4)
Item.create!(:name => "Item5", :price => 5)