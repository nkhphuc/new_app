# frozen_string_literal: true

namespace :db do
  desc 'reseed database data with Faker gem'
  task reseed_data: :environment do
    %w[db:drop db:create db:migrate].each do |task|
      Rake::Task[task].invoke
    end
    puts 'Recreate database successfully!'

    50.times do |_n|
      name = Faker::Device.model_name
      price = Faker::Number.number(digits: 4)
      type = 0
      Product.create! name:, price:, type:
    end
    puts 'Phones created successfully!'

    10.times do |_n|
      name = Faker::Device.unique.manufacturer
      type = 0
      Category.create! name:, type:
    end
    puts 'Phone categories created successfully!'

    50.times do |_n|
      stock = Faker::Number.number(digits: 3)
      product_id = rand(1..50)
      category_id = rand(1..10)
      Inventory.create! stock:, product_id:, category_id:
    end
    puts 'Phone inventories created successfully!'

    50.times do |_n|
      name = Faker::Camera.model
      price = Faker::Number.number(digits: 5)
      type = 1
      Product.create! name:, price:, type:
    end
    puts 'Camera created successfully!'

    10.times do |_n|
      name = Faker::Camera.unique.brand
      type = 1
      Category.create! name:, type:
    end
    puts 'Camera categories created successfully!'

    50.times do |_n|
      stock = Faker::Number.number(digits: 2)
      product_id = rand(51..100)
      category_id = rand(11..20)
      Inventory.create! stock:, product_id:, category_id:
    end
    puts 'Camera inventories created successfully!'

    50.times do |_n|
      name = Faker::Computer.stack
      price = Faker::Number.number(digits: 4)
      type = 2
      Product.create! name:, price:, type:
    end
    puts 'Computers created successfully!'

    2.times do |_n|
      name = Faker::Computer.unique.type
      type = 2
      Category.create! name:, type:
    end
    puts 'Computer categories created successfully!'

    50.times do |_n|
      stock = Faker::Number.number(digits: 2)
      product_id = rand(101..150)
      category_id = rand(21..22)
      Inventory.create! stock:, product_id:, category_id:
    end
    puts 'Computer inventories created successfully!'
  end
end

namespace :db do
  desc 'seed customers data with Faker gem'
  task seed_customers: :environment do
    80.times do |_n|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = Faker::Internet.unique.email
      phone_number = Faker::PhoneNumber.cell_phone_in_e164
      gender = rand(2)
      birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
      plan = [*0..2].sample
      address = ['Hà Nội', 'Huế', 'Đà Nẵng', 'Sài Gòn'].sample
      Customer.create! first_name:, last_name:, email:, phone_number:, gender:, birthday:, plan:, address:
    end

    20.times do |_n|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = Faker::Internet.unique.email
      phone_number = Faker::PhoneNumber.cell_phone_in_e164
      gender = rand(2)
      birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
      address = ['Hà Nội', 'Huế', 'Đà Nẵng', 'Sài Gòn'].sample
      Customer.create! first_name:, last_name:, email:, phone_number:, gender:, birthday:, address:
    end
    puts 'Customers created successfully!'
  end
end

namespace :db do
  desc 'seed timeprices, coupons data'
  task seed_tc: :environment do
    10.times do |_n|
      name = Faker::Beer.name
      price = Faker::Number.number(digits: 3)
      Timeprice.create! name:, price:
    end

    10.times do |_n|
      name = Faker::Coffee.blend_name
      price = Faker::Number.number(digits: 2)
      Coupon.create! name:, price:
    end
    puts 'Timeprices and Coupons created successfully!'
  end
end

namespace :db do
  desc 'seed customers registration dates data'
  task seed_cregdates: :environment do
    (1..100).each do |n|
      registration_date = Faker::Date.between(from: '2019-01-01', to: '2023-01-01')
      Customer.find(n).update! registration_date:
    end
    puts 'Customers registration dates updated successfully!'
  end
end
