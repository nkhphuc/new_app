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
    puts 'Products created successfully'

    10.times do |_n|
      name = Faker::Device.unique.manufacturer
      Category.create! name:
    end
    puts 'Category created successfully'

    100.times do |_n|
      stock = Faker::Number.number(digits: 3)
      product_id = Faker::Number.number(digits: 2)
      category_id = rand(1..10)
      Inventory.create! stock:, product_id:, category_id:
    end
    puts 'Inventory created successfully'
  end
end
