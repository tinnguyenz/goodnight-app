Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'clock-time', to: 'sleep_records#clock_times'
      get 'clock-time/:id', to: 'sleep_records#clock_times'
      post 'follow/:id', to: 'users#follow', as: :follow_user
      post 'unfollow/:id', to: 'users#unfollow', as: :unfollow_user

      resources :posts
    end
  end
end
