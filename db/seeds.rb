require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

20.times do |customer| 
  Customer.create!([
                     {
                       "login" => Faker::Crypto.unique.md5,
                       "name" => Faker::ElderScrolls.name,
                       "url" => Faker::Internet.unique.url,
                       "avatar_url" => Faker::Internet.url,
                       "provider" => Faker::Pokemon.name,
                       "slug" => Faker::Internet.unique.slug,
                       "email" => Faker::Internet.unique.email,
                       "location" => Faker::Address.country
                     },
                   ])
end

customer_count = 1
20.times do |wallet|
  Wallet.create!([
                   {
                     "customer_id" => customer_count,
                     "address" => Faker::Crypto.unique.sha256,
                     "balance" => Faker::Number.decimal(rand(1..8), 2),
                     "alias" => Faker::Pokemon.unique.move
                   }
                 ])
  customer_count += 1
end
