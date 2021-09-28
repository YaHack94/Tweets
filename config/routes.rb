Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :tweets
  post 'tweets/confirm', to: 'tweets#confirm', as: 'confirm'
  delete '/tweets/:id', to: 'tweets#destroy', as: 'destroy'
  root 'tweets#index'
  get '/exemple', to: 'tweets#base'
end
