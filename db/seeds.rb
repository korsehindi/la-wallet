require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

customer_count = 0
150.times do |customer| 
  Customer.create!([
                     {
                       "login" => Faker::Crypto.unique.md5,
                       "name" =>Faker::Name.name,
                       "url" => Faker::Internet.unique.url,
                       "avatar_url" => Faker::Internet.url,
                       "provider" => Faker::App.name,
                       "slug" => Faker::Internet.unique.slug,
                       "email" => Faker::Internet.unique.email,
                       "location" => Faker::Address.country
                     },
                   ])
  Wallet.create!([
                   {
                     "customer" => customer_count,
                     "address" => Faker::Crypto.unique.sha256,
                     "balance" => Faker::Number.decimal(4),
                     "alias" => Faker::Hacker.noun,
                     }
                 ])
  customer_count += 1
end
