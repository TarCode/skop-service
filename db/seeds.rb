# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# NB: CREATE A USER BY SIGNING UP BEFORE RUNNING THE SEED SCRIPT

Store.destroy_all
Category.destroy_all
Product.destroy_all
Price.destroy_all
Sale.destroy_all

store1 = Store.create(name: "Bob's Burgers", user_id: 1)
store2 = Store.create(name: 'Obama Fried Chicken', user_id: 1)

category1 = Category.create(name: 'Burgers')
category2 = Category.create(name: 'Chicken')

product1 = Product.create(name: "Bob's Whopper", store: store1, category: category1)
product2 = Product.create(name: 'Streetwise 9', store: store2, category: category2)

Price.create(value_in_cents: 2000, unit: 'R', product: product1)
Price.create(value_in_cents: 3000, unit: 'R', product: product2)

Sale.create(total_in_cents: 2000, unit: 'R', store: store1, user_id: 1)
Sale.create(total_in_cents: 3000, unit: 'R', store: store2, user_id: 1)
