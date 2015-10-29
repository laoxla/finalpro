10.times do |n|

 User.create! first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "example#{n}.com", description: Faker::Lorem.sentence, password: "12345678", address: Faker::Address.state


end
