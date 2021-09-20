module Api 
    module V1 
        class FollowsController < ApplicationController
            def create 
                if already_followed?
                    destroy
                else
                    follow = Follow.new(follow_params)
                    follow.save
                    render json: follow, created: true
                end
            end

            def destroy
                @follow.destroy
                render json: @follow, destroyed: true
            end


            private 

            def follow_params
                params.require(:user).permit(
                    :follower_id,
                    :followed_user_id
                )
            end

            def already_followed?
                @follow = Follow.find_by(follow_params)
            end

        end
    end
end
