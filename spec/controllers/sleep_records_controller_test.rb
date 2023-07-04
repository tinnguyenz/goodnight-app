require 'rails_helper'

RSpec.describe Api::V1::SleepRecordsController, type: :request do
  describe 'GET my clock times data' do
    before do
      FactoryBot.create(:user, :with_sleep_records)
      FactoryBot.create_list(:sleep_record, 25)
      get '/api/v1/clock-time'
    end

    it 'returns the clock-in times with user information' do
      sleep_records = JSON.parse(response.body)['sleep_records']
      puts sleep_records
      expect(sleep_records.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
