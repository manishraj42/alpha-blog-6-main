Rails.application.routes.draw do
  root 'pages#home'
  get 'about' , to:'pages#about'
  #the below line imports the articles model to be used for backend
  resources :articles , only: [:show, :new,:create,:index, :edit, :update, :destroy]
  get 'signup', to: 'users#new'
  resources :users , except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end

