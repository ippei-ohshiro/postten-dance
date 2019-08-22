Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create,  :edit, :update] do
    member do
      get :attend
      get :attendance_user
    end
     collection do
      get :search
    end
  end
  
  resources :lessons
  resources :attendances, only: [:create, :destroy]
end
