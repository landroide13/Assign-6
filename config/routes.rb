Rails.application.routes.draw do
 
  #get 'messages/inbox' 

  resources :messages do
    collection do
      get :inbox
      get :sent
    end
  end    


  get 'profile' => 'user#edit'
  get 'friends' => 'friends#index'

  get 'auth/provider/callback' => 'sessions#callback'

  delete 'remove_friend' => 'friendship#destroy'

  resources :friendships

  get 'sessions/new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get 'users/new'

  resources :users
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
