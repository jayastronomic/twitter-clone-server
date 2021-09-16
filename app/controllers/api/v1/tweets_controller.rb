module Api 
    module V1
        class TweetsController < ApplicationController


            def index
                tweets = Tweet.order("created_at DESC")
                render json: tweets, current_user_id: current_user.id
            end


            def create
                tweet = Tweet.new(tweet_params)
                tweet.user = current_user
                tweet.save
                render json: tweet
            end

            def user_tweet_index
                user = current_user
                user_tweets = user.tweets.order("created_at DESC")
                render json: user_tweets, current_user_id: user.id
            end

            def destroy
                tweet = Tweet.find(params[:id])
                tweet.destroy
                render json: tweet, destroyed: true
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