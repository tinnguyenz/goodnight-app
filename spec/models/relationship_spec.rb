require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe "validations" do
    it "requires the presence of a follower" do
      relationship = Relationship.new(followee_id: 1)
      expect(relationship).not_to be_valid
      expect(relationship.errors[:follower]).to include("can't be blank")
    end

    it "requires the presence of a followee" do
      relationship = Relationship.new(follower_id: 1)
      expect(relationship).not_to be_valid
      expect(relationship.errors[:followee]).to include("can't be blank")
    end
  end

  describe "associations" do
    it "belongs to a follower" do
      expect(Relationship.reflect_on_association(:follower).macro).to eq(:belongs_to)
    end

    it "belongs to a followee" do
      expect(Relationship.reflect_on_association(:followee).macro).to eq(:belongs_to)
    end
  end

end
