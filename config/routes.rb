Rails.application.routes.draw do
  get '/clockin', to: 'sleep_records#clock_in_times'
  post '/users/:id/follow', to: 'users#follow'
  post '/users/:id/unfollow', to: 'users#unfollow'
end
