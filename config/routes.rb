Rails.application.routes.draw do
 
  resources :posts
  #get 'messages/inbox' 

  resources :messages do
    collection do
      get :inbox
      get :sent
    end
  end    

  post 'toggle_like' => 'likes#toggle' 

  get 'profile' => 'users#edit'
  put 'update'  => 'users#update'
  get 'friends' => 'friends#index'

  #get 'auth/provider/callback' => 'sessions#callback'

  delete 'remove_friend' => 'friendships#destroy'
  resources :friendships

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  resources :users
  get 'users/new'
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
