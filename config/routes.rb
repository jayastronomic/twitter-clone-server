Rails.application.routes.draw do
  namespace 'api' do 
    namespace 'v1' do 
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      get '/logged_in', to: 'sessions#is_logged_in?'
      resources :users, only: [:create, :index, :update] do 
        get '/user_tweets', to: 'tweets#user_tweet_index'
      end
      resources :tweets, only: [:create, :index]
    end
  end
end
