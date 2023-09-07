# frozen_string_literal: true

namespace :db do
  desc 'reseed database data with Faker gem'
  task reseed_data: :environment do
    %w[db:drop db:create db:migrate].each do |task|
      Rake::Task[task].invoke
    end
    puts 'Recreate database successfully!'

    100.times do |_n|
      name = Faker::Device.model_name
      price = Faker::Number.number(digits: 4)
      Product.create! name:, price:
    end
    puts 'Products created successfully!'

    10.times do |_n|
      name = Faker::Device.unique.manufacturer
      Category.create! name:
    end
    puts 'Categories created successfully!'

    100.times do |_n|
      stock = Faker::Number.number(digits: 3)
      product_id = Faker::Number.number(digits: 2)
      category_id = rand(1..10)
      Inventory.create! stock:, product_id:, category_id:
    end
    puts 'Inventories created successfully!'
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
