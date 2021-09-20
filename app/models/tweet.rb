class Tweet < ApplicationRecord
    belongs_to :user
    

    has_many :likes, dependent: :destroy
    has_many :liked_by, through: :likes, source: :user, dependent: :destroy

    validates :content, length: { maximum: 200 }
    validates :content, length: { minimum: 1 }
end
