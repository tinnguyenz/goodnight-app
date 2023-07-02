Rails.application.routes.draw do
  get '/clockin', to: 'sleep_records#clock_in_times'
end
