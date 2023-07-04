class User < ApplicationRecord
  validates_presence_of :name

  has_many :sleep_records, dependent: :destroy
  
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followee_id', dependent: :destroy
  has_many :followees, through: :active_relationships, source: :followee
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(user_to_follow_id)
    active_relationships.create(followee_id: user_to_follow_id)
  end

  def unfollow(user_to_unfollow_id)
    active_relationships.find_by(followee_id: user_to_unfollow_id).destroy
  end
end
