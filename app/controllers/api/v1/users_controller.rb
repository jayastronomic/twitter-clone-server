module Api
    module V1
      class UsersController < ApplicationController
        def index
          users = User.all
          render json: users 
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

        def follow
          user = current_user
          users = User.where.not(id: current_user.id)
          render json: users
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
              :password_confirmation)
        end


        
      end
   end 
end