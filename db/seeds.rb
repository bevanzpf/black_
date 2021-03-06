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

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
