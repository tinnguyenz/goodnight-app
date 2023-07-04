require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:sleep_records).dependent(:destroy) }
    it { should have_many(:active_relationships).class_name('Relationship').with_foreign_key('follower_id').dependent(:destroy) }
    it { should have_many(:passive_relationships).class_name('Relationship').with_foreign_key('followee_id').dependent(:destroy) }
    it { should have_many(:followees).through(:active_relationships) }
    it { should have_many(:followers).through(:passive_relationships) }
  end
  
  describe "follow and unfollow" do
    let(:user1) { FactoryBot.create(:user) }
    let(:user2) { FactoryBot.create(:user) }

    it "allows user to follow another user" do
      expect {
        user1.follow(user2.id)
      }.to change(user1.followees, :count).by(1)
    end

    it "allows user to unfollow another user" do
      user1.follow(user2.id)
      expect {
        user1.unfollow(user2.id)
      }.to change(user1.followees, :count).by(-1)
    end
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end
end
