class User < ApplicationRecord
    has_many :sleep_records, dependent: :destroy

    has_many :follows, foreign_key: :follower_id, dependent: :destroy
    has_many :followees, through: :follows, source: :followeee
    has_many :followers, through: :follows, source: :follower
  end