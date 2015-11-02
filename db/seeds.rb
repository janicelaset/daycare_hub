# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  users = User.create([{ user_name: "User 1", email: "user1@email.com", password: "user1234", password_confirmation: "user1234" },
                       { user_name: "User 2", email: "user2@email.com", password: "user1234", password_confirmation: "user1234" },
                       { user_name: "User 3", email: "user3@email.com", password: "user1234", password_confirmation: "user1234" },
                       { user_name: "User 4", email: "user4@email.com", password: "user1234", password_confirmation: "user1234" },
                       { user_name: "User 5", email: "user5@email.com", password: "user1234", password_confirmation: "user1234" }])

  daycares = Daycare.create([{ name: "SwedeCare", user_id: users[0].id },
                            { name: "Kindercare Farmington", user_id: users[1].id },
                            { name: "Turquoise Learning Tree", user_id: users[2].id },
                            { name: "Kindercare Baseline", user_id: users[3].id},
                            { name: "Bright Horizons", user_id: users[4].id }])

  Address.create([{ street: "2222 SE Foxglove Ct", city: "Hillsboro", state: "OR", zip: "97123", daycare_id: daycares[0].id },
                    { street: "18000 SW Farmington Rd", city: "Aloha", state: "OR", zip: "97007", daycare_id: daycares[1].id },
                    { street: "15135 SW Beard Rd", city: "Beaverton", state: "OR", zip: "97007", daycare_id: daycares[2].id },
                    { street: "18685 SW Baseline Rd", city: "Beaverton", state: "OR", zip: "97006", daycare_id: daycares[3].id },
                    { street: "15150 SW Koll Pkwy", city: "Beaverton", state: "OR", zip: "97006", daycare_id: daycares[4].id }])
