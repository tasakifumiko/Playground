Rails.application.routes.draw do
  
  devise_for :user, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  # registrations: "admin/registrations",
  sessions: "admin/sessions"
  }

  root to: "user/homes#top"
  get '/about' => "user/homes#about", as:"about"

  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :update] do
     resources :reviews, only: [:create, :destroy, :index, :show, :update]
    end
  end
  
  

  scope module: :user do
      resources :posts do
         resources :reviews, only: [:create, :destroy]
         resource :bookmarks, only: [:create, :destroy]
      end

      resources :users, only: [:show, :edit, :update] do
        resources :bookmarks, only: [:index, :create, :destroy]
          collection do
              get "users/complete" => "users#complete", as:"complete"
          end
      end

       resources :genres, only: [:show]
       resources :areas, only: [:show]
       get "users/unsubscribe" => "users#unsubscribe", as:"unsubscribe"
       patch "users/withdraw" => "users#withdraw", as:"withdraw"
       get "search" => "searches#search"
       post "filter" => "searches#filter", as: "filter"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
