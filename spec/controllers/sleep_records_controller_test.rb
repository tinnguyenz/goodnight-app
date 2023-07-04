require 'rails_helper'

RSpec.describe Api::V1::SleepRecordsController, type: :request do
  describe 'GET my clock times data' do
    it 'returns the clock-in times with user information' do
      user1 = FactoryBot.create(:user, name: 'Cardi B')
      user2 = FactoryBot.create(:user, name: 'Offset')
      FactoryBot.create(:relationship, follower: user1, followee: user2)

      sleep_record1 = FactoryBot.create(:sleep_record, clock_in_time: Time.now, user: user1)
      sleep_record2 = FactoryBot.create(:sleep_record, clock_in_time: Time.now - 1.hour, user: user1)
      sleep_record3 = FactoryBot.create(:sleep_record, clock_in_time: Time.now - 2.hours, user: user2)

      get "/api/v1/clock-time"

      expect(response).to have_http_status(:success)
      response_body = JSON.parse(response.body)
      sleep_records = response_body['sleep_records']

      expect(sleep_records).to include(
        "Record from user Cardi B: clock-in: #{sleep_record2.clock_in_time.utc}, clock-out: #{sleep_record2.clock_out_time.utc}",
        "Record from user Cardi B: clock-in: #{sleep_record1.clock_in_time.utc}, clock-out: #{sleep_record1.clock_out_time.utc}",
        "Record from user Offset: clock-in: #{sleep_record3.clock_in_time.utc}, clock-out: #{sleep_record3.clock_out_time.utc}"
      )
    end
  end
end
