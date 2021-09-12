module Api 
    module V1
        class TweetSerializer < ActiveModel::Serializer
            attributes :id, :content, :tweet_user_username, :tweet_user_name


            def tweet_user_username
                object.user.username
            end

            def tweet_user_name
                object.user.name
            end


        end
    end
end
