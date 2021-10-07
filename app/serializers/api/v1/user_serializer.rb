module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      include Rails.application.routes.url_helpers
      attributes :id, :username, :name, :bio, :location, :website, :logged_in, :total_tweets, :followers, :followings, :month_joined, :year_joined, :avatar_exist, :avatar_url, :followed_user, :follows_you

      def logged_in
        @instance_options[:logged_in]
      end

      def total_tweets
        object.tweets.count
      end

      def followers
        object.received_follows.length
      end

      def followings
        object.given_follows.length
      end

      def month_joined
        months = {
          "1": "January",
          "2": "Febuary",
          "3": "March",
          "4": "April",
          "5": "May",
          "6": "June",
          "7": "July",
          "8": "August",
          "9": "September",
          "10": "October",
          "11": "November", 
          "12": "December"
        }
        month = months[object.created_at.month.to_s.to_sym]
        return month
      end

      def year_joined
        object.created_at.year.to_s 
      end

      def avatar_url
        if avatar_exist
          url_for(object.avatar)
        else
          nil
        end
      end

      def avatar_exist
        object.avatar.attached?
      end

      def followed_user
        Follow.where(follower_id: @instance_options[:current_user_id], followed_user_id: object.id).exists?
      end 
       
       def follows_you
        Follow.where(follower_id: object.id , followed_user_id: @instance_options[:current_user_id]).exists?
      end

    

    end
  end
end

