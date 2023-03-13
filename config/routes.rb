Rails.application.routes.draw do

  devise_for :user, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  
  root to: "user/homes#top"
  get '/about' => "user/homes#about", as:"about"
  
  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :update]
  end
  
  scope module: :user do
    resources :posts do
     resources :reviews, only: [:create, :destroy]
    end
    resources :bookmarks, only: [:index, :create, :destroy]
    resources :users, only: [:show, :edit, :update] do
      collection do
        get "users/complete" => "users#complete", as:"complete"
      end 
   end
    
    
    
    
    get "users/unsubscribe" => "users#unsubscribe", as:"unsubscribe"
    patch "users/withdraw" => "users#withdraw", as:"withdraw"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
