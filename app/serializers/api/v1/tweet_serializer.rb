module Api 
    module V1
        class TweetSerializer < ActiveModel::Serializer
            include Rails.application.routes.url_helpers
            attributes :id, :user_id, :content, :tweet_user_username, :tweet_user_name, :liked_by_current_user, :destroyed, :avatar_exist, :avatar_url
            def tweet_user_username
                object.user.username
            end

            def tweet_user_name
                object.user.name
            end

            def liked_by_current_user
                Like.where(user_id: @instance_options[:current_user_id], tweet_id: object.id).exists?
            end

            def destroyed
                @instance_options[:destroyed]
            end

            def avatar_exist
                object.user.avatar.attached?
            end

            def avatar_url
                if avatar_exist
                    url_for(object.user.avatar)
                else
                    nil
                end
            end


        end
    end
end
