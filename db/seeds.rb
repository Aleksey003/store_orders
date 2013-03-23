# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ProductCategory.delete_all
cat1 = ProductCategory.create(name: "Sport")
cat2 = ProductCategory.create(name: "Food")
cat3 = ProductCategory.create(name: "Medic")

ProductState.delete_all
state1 = ProductState.create(name:'New')
state2 = ProductState.create(name:'Sale')

Product.delete_all
Asset.delete_all
50.times do |i|
	p = Product.create(title: "Sport product #{i}",description: 'description product '*10, product_state: state1,product_category: cat1)
	asset = Asset.new()
	asset.product_id = p.id    
    asset.save
end
50.times do |i|
	p = Product.create(title: "Food product #{i}",description: 'description product '*10, product_category: cat2)
	asset = Asset.new()
	asset.product_id = p.id    
    asset.save
end
50.times do |i|
	p = Product.create(title: "Medic product #{i}",description: 'description product '*10, product_category: cat3)
	asset = Asset.new()
	asset.product_id = p.id    
    asset.save
end