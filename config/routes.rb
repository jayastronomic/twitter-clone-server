Rails.application.routes.draw do
  namespace 'api' do 
    namespace 'v1' do 
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      get '/logged_in', to: 'sessions#is_logged_in?'
      resources :users, only: [:create, :index, :update, :show] do 
        get '/auth_user_tweets', to: 'tweets#auth_user_tweet_index'
        get '/user_tweets', to: 'tweets#user_tweet_index'
        get '/followers', to: 'users#followers'
        get '/followings', to: 'users#followings'
        patch '/update_avi', to: 'users#update_avi' 
        resources :likes, only: [:index, :create, :destroy]
        get '/user_likes', to: 'likes#user_likes'
      end
      get "/all_likes", to: 'likes#like_index'
      resources :tweets, only: [:create, :index, :destroy, :update, :show]
      resources :follows, only: [:create, :destroy]
      get "/follow", to: "users#follow"
    end
  end
end
