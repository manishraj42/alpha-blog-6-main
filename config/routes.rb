Rails.application.routes.draw do
  root 'pages#home'
  get 'about' , to:'pages#about'
  #the below line imports the articles model to be used for backend
  resources :articles, only: [:show]
end
