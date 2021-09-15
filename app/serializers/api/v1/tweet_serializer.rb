module Api 
    module V1
        class TweetSerializer < ActiveModel::Serializer
            attributes :id, :content, :tweet_user_username, :tweet_user_name, :liked_by_current_user  


            def tweet_user_username
                object.user.username
            end

            def tweet_user_name
                object.user.name
            end

            def liked_by_current_user
                Like.where(user_id: @instance_options[:current_user_id], tweet_id: object.id).exists?
            end


        end
    end
end
