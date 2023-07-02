User.destroy_all
SleepRecord.destroy_all
Relationship.destroy_all

user1 = User.create(name: 'Queen')
user2 = User.create(name: 'Greenday')
user3 = User.create(name: 'Led Zeppelin')

user1.sleep_records.create(clock_in_time: DateTime.new(2023, 6, 1, 22, 0), clock_out_time: DateTime.new(2023, 6, 2, 6, 0))
user1.sleep_records.create(clock_in_time: DateTime.new(2023, 6, 2, 23, 0), clock_out_time: DateTime.new(2023, 6, 3, 7, 0))

Relationship.create(follower: user2, followee: user1)
Relationship.create(follower: user3, followee: user1)
