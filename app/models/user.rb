class User < ApplicationRecord
    has_many :sleep_records, dependent: :destroy
  
    has_many :followed_users, foreign_key: :follower_id, class_name: "Relationship"
    has_many :followees, through: :followed_users, dependent: :delete_all
  
    has_many :following_users, foreign_key: :followee_id, class_name: "Relationship"
    has_many :followers, through: :following_users, dependent: :delete_all


    def follow(user_to_follow_id)   
      active_relationships.create(followee_id: user_to_follow_id)
    end

    def unfollow(user_to_unfollow_id)
      active_relationships.find_by(followee_id: user_to_unfollow_id)&.destroy
    end
end
