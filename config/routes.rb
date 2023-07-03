Rails.application.routes.draw do
  get '/clockin', to: 'sleep_records#clock_in_times'
  
  post '/api/follow/:id', to: 'users#follow', as: :follow_user
  post '/api/unfollow/:id', to: 'users#unfollow', as: :unfollow_user

end
