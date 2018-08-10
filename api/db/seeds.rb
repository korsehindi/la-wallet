# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create([
                  { "email"=>"irwinwatsica@jones.biz",
                    "password_digest"=>"28f719c89ef7f33ce2e178490676b5ab",
                    "slug"=>"ex_assumenda",
                    "name"=>"Troy Leuschke",
                    "title"=>"Ms.",
                    "gender"=>"Non-binary",
                    "age"=>67,
                    "country"=>"AD" },

                  { "email"=>"myron@grant.biz",
                    "password_digest"=>"ec2d4e2cdf77da89694ed921f6fa7a8c",
                    "slug"=>"natus_sunt",
                    "name"=>"Jonathan Howe",
                    "title"=>"Mr.",
                    "gender"=>"Male",
                    "age"=>58,
                    "country"=>"MS" },

                  { "email"=>"sadie@borermarquardt.info",
                    "password_digest"=>"d94016c07f86a27e30bef01e2b8409ac",
                    "slug"=>"aliquam_fuga",
                    "name"=>"Gale Miller",
                    "title"=>"Mrs.",
                    "gender"=>"Genderfluid",
                    "age"=>17,
                    "country"=>"TK" }
                ])
