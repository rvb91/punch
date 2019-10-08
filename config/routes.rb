Rails.application.routes.draw do
  resources :events
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "punch#go"

  resources :punch, only:[] do
    collection do 
      get 'go'
      post 'go', to: 'punch#submit_go'
    end

  end
end
