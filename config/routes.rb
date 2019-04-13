Rails.application.routes.draw do
  
  root 'feeds#index'
  
  resources :feeds do
    collection do
      post :confirm
    end
  end

   resources :users, only: [:new, :create ,:show]
   
   resources :sessions, only: [:new, :create, :destroy]
   
end



