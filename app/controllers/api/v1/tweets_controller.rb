module Api 
    module V1
        class TweetsController < ApplicationController


            def index
                tweets = Tweet.order("created_at DESC")
                render json: tweets
            end


            def create
                tweet = Tweet.new(tweet_params)
                tweet.user = current_user
                tweet.save
                render json: tweet
            end


            private 

            def tweet_params
                params.require(:tweet).permit(
                    :content
                )
            end
        end
    end
end