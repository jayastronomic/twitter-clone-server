module Api
    module V1
        class LikesController < ApplicationController
            def index
                user = current_user
                user_likes = user.likes.order("created_at DESC")
                render json: user_likes, current_user_id: user.id
            end 
            
            def like_index
                likes = Like.all
                render json: likes
            end
            
            
            def create
                if already_liked?
                    destroy
                else
                    like = Like.new(like_params)
                    like.save
                    render json: like, created: true, current_user_id: like.user.id
                end
            end


            def destroy
                @like.destroy
                render json: @like, created: false
            end


            private 

            def like_params
                params.require(:user).permit(
                    :user_id,
                    :tweet_id
                )
            end

            def already_liked?
                @like = Like.find_by(like_params)
            end
        end
    end
end