require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe "POST #follow" do
    it "returns a successful response" do
      post '/api/v1/follow/1'
      expect(response).to be_successful
    end
  end

  describe "POST #unfollow" do
    it "returns a successful response" do
      post '/api1/v1/unfollow/1'
      expect(response).to be_successful
    end
  end
end
