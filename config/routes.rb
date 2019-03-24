Rails.application.routes.draw do
  
  resources :feeds do
    collection do
      post :confirm
    end
  end

   resources :users, only: [:new, :create]
  
  resources :sessions, only: [:new, :create, :destroy]
end



