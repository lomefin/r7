Rails.application.routes.draw do
  resources :articles do
    member do
      put :like
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/notice', to: 'articles#clear_message'
end
