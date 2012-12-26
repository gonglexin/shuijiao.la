ShuijiaoLa::Application.routes.draw do
  root :to => 'home#index'

  get 'signup'    => 'users#new',        :as => 'signup'
  get 'login'     => 'sessions#new',     :as => 'login'
  delete 'logout' => 'sessions#destroy', :as => 'logout'

  match '/auth/:provider/callback' => 'sessions#create'

  resources :users, :only => [:create, :show]
  resources :sessions, :only => [:create, :destroy]
end
