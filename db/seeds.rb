User.destroy_all
SleepRecord.destroy_all
Relationship.destroy_all

users = [
  "Imagine Dragons",
  "Cardi B",
  "The Weeknd",
  "Billie Eilish",
  "Bruno Mars",
  "Bon Jovi"
]

users.each do |name|
  User.create(name: name)
end

users_count = User.count

User.all.each do |user|
  # Randomly pick a number of followers (1 to 5)
  num_followers = rand(1..5)

  # Random users to follow
  followers = User.where.not(id: user.id).sample(num_followers)

  # Give them followers
  followers.each do |follower|
    follower.follow(user.id)
  end
end

# Have 10 days of sleep records data
User.all.each do |user|
  (1..10).each do |day|
    clock_in_time = Time.now - (day * 24 * 60 * 60) + rand(0..24).hours
    clock_out_time = clock_in_time + rand(4..10).hours

    user.sleep_records.create(clock_in_time: clock_in_time, clock_out_time: clock_out_time)
  end
end
