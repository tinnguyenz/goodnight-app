FactoryBot.define do
  factory :sleep_record do
    user
    clock_in_time { Time.now - 8.hours }
    clock_out_time { Time.now }
  end
end
