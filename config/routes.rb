Rails.application.routes.draw do
  root 'users#new'
  post 'register' => "users#register"
  get 'ask' => "users#ask"
  post 'response' => "users#save_response"
  get 'show_score' => "users#show_score"
end
