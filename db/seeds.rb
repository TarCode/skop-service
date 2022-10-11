# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
store1 = Store.create(name: "Bob's Burgers")
store2 = Store.create(name: 'Obama Fried Chicken')

category1 = Category.create(name: 'Burgers')
category2 = Category.create(name: 'Chicken')

Product.create(name: "Bob's Whopper", store: store1, category: category1)
Product.create(name: 'Streetwise 9', store: store2, category: category2)
