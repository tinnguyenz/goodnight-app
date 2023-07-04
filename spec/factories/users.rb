FactoryBot.define do
  factory :user do
    name { Faker::Name.name }

    trait :with_sleep_records do
      after(:create) do |user|
        create_list(:sleep_record, 10, user: user)
      end
    end
  end
end
