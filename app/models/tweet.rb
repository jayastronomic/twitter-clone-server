class Tweet < ApplicationRecord
    belongs_to :user

    validates :content, length: { maximum: 200 }
    validates :content, length: { minimum: 1 }
end
