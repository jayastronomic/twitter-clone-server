module Api 
    module V1
        class TweetsController < ApplicationController


            def index
                user = current_user
                if user
                    tweets = Tweet.where("user_id IN (?) OR user_id = ?", user.following_ids, user.id).order('created_at DESC')
                    render json: tweets, current_user_id: current_user.id
                else
                    tweets = []
                    render json: tweets
                end
            end


            def create
                tweet = Tweet.new(tweet_params)
                tweet.user = current_user
                tweet.save
                render json: tweet
            end

            def auth_user_tweet_index
                auth_user = current_user
                auth_user_tweets = auth_user.tweets.order("created_at DESC")
                render json: auth_user_tweets, current_user_id: auth_user.id
            end

            def user_tweet_index
                auth_user = current_user
                user = User.find(params[:user_id])
                user_tweets = user.tweets.order("created_at DESC")
                render json: user_tweets, current_user_id: auth_user.id 
            end

            def destroy
                tweet = Tweet.find(params[:id])
                tweet.destroy
                render json: tweet, destroyed: true
            end 

            def update
                tweet = Tweet.find(params[:id])
                tweet.update(content: params[:content])
                updatedTweet = tweet
                render json: updatedTweet
            end

            def show 
                user = current_user
                tweet = Tweet.find(params[:id])
                render json: tweet, current_user_id: user.id
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