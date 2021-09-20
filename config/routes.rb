Rails.application.routes.draw do
  namespace 'api' do 
    namespace 'v1' do 
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      get '/logged_in', to: 'sessions#is_logged_in?'
      resources :users, only: [:create, :index, :update] do 
        get '/user_tweets', to: 'tweets#user_tweet_index'
        resources :likes, only: [:index, :create, :destroy]
      end
      resources :tweets, only: [:destroy]
      get "/all_likes", to: 'likes#like_index'
      resources :tweets, only: [:create, :index]
      resources :follows, only: [:create, :destroy]
      get "/follow", to: "users#follow"
    end
  end
end
