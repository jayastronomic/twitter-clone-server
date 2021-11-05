module Api
    module V1
      class UsersController < ApplicationController
        def index
          users = User.all
          render json: users.with_attached_avatar
        end

        def show
          auth_user = current_user
          user = User.find(params[:id])
          render json: user, current_user_id: auth_user.id
        end


        def create
            @user = User.new(user_params)
            if @user.save
              login!
              render json: @user, logged_in: true
            else 
              render json: { status: 500, errors: @user.errors.full_messages }
            end
        end

        def update
          user = current_user
          user.update(user_params)
          render json: user
        end

        def update_avi
          user = current_user
          user.avatar.attach(params[:avatar])
          render json: user
        end

        def follow
          user = current_user
          users = User.where.not(id: user.id)
          render json: users, current_user_id: user.id
        end

        def followers
          user = current_user
          user_followers = user.followers
          render json: user_followers, current_user_id: user.id
        end

        def followings
          user = current_user
          user_followings = user.followings
          render json: user_followings, current_user_id: user.id
        end

    

        private
          
        def user_params
            params.require(:user).permit(
              :username,
              :name,
              :bio,
              :website,
              :location, 
              :email, 
              :password, 
              :password_confirmation,
              
              :background
              )
        end


        
      end
   end 
end