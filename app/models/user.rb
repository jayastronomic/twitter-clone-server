class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar
    has_one_attached :background

    # Will return an array of follows for the given user instance
    has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"

    # Will return an array of users who follow the user instance
    has_many :followers, through: :received_follows, source: :follower

     # returns an array of follows a user gave to someone else
    has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"
  
    # returns an array of other users who the user has followed
    has_many :followings, through: :given_follows, source: :followed_user

    has_many :tweets, dependent: :destroy

    has_many :likes, dependent: :destroy
    has_many :liked_tweets, through: :likes, source: :tweet, dependent: :destroy

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: { within: 1..15 }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    validates :location, length: { maximum: 30 }
    validates :name, length: { maximum: 50 }
    validates :name, presence: true
    validates :bio, length: { maximum: 160 }
    validates :website, length: { maximum: 100 }
     
end

