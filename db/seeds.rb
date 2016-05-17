User.create!(name: "Example User",
            email: "hello@gg.com",
            password: "abc123",
            password_confirmation: "abc123",
            admin: true,
            activated: true,
            activated: Time.zone.now.to_datetime)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@black.com"
  password = "password"
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now.to_datetime)

end
