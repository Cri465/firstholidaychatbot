Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'signup', to: 'users#new'
  resources :users, except: [ :new ]
  get 'login', to: 'session#new'
  get 'wanderer', to: 'chatbot#index'
  post 'login', to: 'sessions#create'
  delete "logout", to: "sessions#destroy"
  post "message", to: 'messages#create'
end
